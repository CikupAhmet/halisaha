using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Google.Authenticator;

namespace WebApplication4
{
    public partial class FacebookLogin : System.Web.UI.Page
    {
        static string baglanstr = "workstation id=halisaha.mssql.somee.com;packet size=4096;user id=sqRa_SQLLogin_1;pwd=lcmc2rgtt6;data source=halisaha.mssql.somee.com;persist security info=False;initial catalog=halisaha";
        SqlConnection baglanti = new SqlConnection(baglanstr);
        SqlCommand komut = new SqlCommand();

        private void idToSession()
        {
            string mail = (string)Session["mail"];
            baglanti.Open();
            komut.Connection = baglanti;
            komut.CommandText = "SELECT kullaniciID FROM kullanici where kullaniciMail=@email";
            komut.Parameters.AddWithValue("@email", labelMail.Text);
            komut.ExecuteNonQuery();
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                Session["userID"] = dr["kullaniciID"].ToString();
            }
            baglanti.Close();
        }

        bool checkEmailUnique(string email)
        {
            komut.CommandText = "SELECT COUNT(*) FROM kullanici where kullaniciMail=@mail";
            komut.Parameters.AddWithValue("@mail", email);
            komut.Connection = baglanti;
            baglanti.Open();
            komut.ExecuteNonQuery();

            int emailCount = Convert.ToInt16(komut.ExecuteScalar());
            baglanti.Close();
            if (emailCount != 0)
                return false;
            return true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["uid"]))
            {

                return;
            }
            if (string.IsNullOrEmpty(Request.QueryString["uname"]))
                return;
            if (string.IsNullOrEmpty(Request.QueryString["uemail"]))
                return;

            //string text = Request.QueryString["uid"] + ", " + Request.QueryString["uname"] + ", " + Request.QueryString["uemail"];
            
            labelName.Text = Request.QueryString["uname"];
            labelMail.Text = Request.QueryString["uemail"];
            labelID.Text = Request.QueryString["uid"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string code = (string)Session["qrCode"];
            string email = labelMail.Text;

            if (!checkEmailUnique(email))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alreadyExistsEmail()", true);
                return;
            }

            string mevki = string.Empty;

            if (RadioButton1.Checked)
            {
                mevki = "Kaleci";
            }
            else if (RadioButton2.Checked)
            {
                mevki = "Defans";
            }
            else if (RadioButton3.Checked)
            {
                mevki = "OrtaSaha";
            }
            else if (RadioButton4.Checked)
            {
                mevki = "Forvet";
            }

            komut.CommandText = "INSERT INTO kullanici (kullaniciID, kullaniciAdSoyad, kullaniciSifre, kullaniciMail, kullaniciTel, kullaniciDogum," +
                        " kullaniciMevki) VALUES (@id, @adsoyad, @sifre, @email, @phone, @dogum, @mevki)";
            komut.Parameters.AddWithValue("@id", labelID.Text);
            komut.Parameters.AddWithValue("@adsoyad", labelName.Text);
            komut.Parameters.AddWithValue("@sifre", labelID.Text);
            komut.Parameters.AddWithValue("@email", labelMail.Text);
            komut.Parameters.AddWithValue("@phone", textTelefon.Text);
            komut.Parameters.AddWithValue("@dogum", textDogum.Text);
            komut.Parameters.AddWithValue("@mevki", mevki);

            komut.Connection = baglanti;
            baglanti.Open();
            komut.ExecuteNonQuery();
            baglanti.Close();
            TwoFactorAuthenticator tfa = new TwoFactorAuthenticator();
            var setupInfo = tfa.GenerateSetupCode("Halisaha", "Halisaha", "f729877b2b104d0eb717610e9cf7a532-" + labelID.Text, 300, 300);
            string qr = setupInfo.QrCodeSetupImageUrl;
            string key = setupInfo.ManualEntryKey;
            Session["qrCode"] = qr.ToString();
            qrCode.Src = qr.ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string mail = (string)Session["mail"];
            komut.CommandText = "SELECT COUNT(*) FROM kullanici where kullaniciMail=@mail";
            komut.Parameters.AddWithValue("@mail", labelMail.Text);
            komut.Connection = baglanti;
            baglanti.Open();
            komut.ExecuteNonQuery();
            int count = Convert.ToInt32(komut.ExecuteScalar());
            Session["userID"] = labelID.Text;
            baglanti.Close();

            if (count >= 1)
            {
                qrOnay.Visible = true;
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }
        public void control()
        {
            string uID = (string)Session["userID"];
            TwoFactorAuthenticator tfa = new TwoFactorAuthenticator();
            bool isValid = tfa.ValidateTwoFactorPIN("f729877b2b104d0eb717610e9cf7a532-" + uID, txtcode.Text);
            if (isValid)
            {
                idToSession();
                Response.Redirect("anaSayfa.aspx");
            }
            else
            {
                // hata mesajı ver
            }
        }

        protected void btnPasswordControl_Click(object sender, EventArgs e)
        {
            control();
        }
    }
}