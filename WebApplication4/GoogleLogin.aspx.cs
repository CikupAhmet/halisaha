using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net;
using System.IO;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using Google.Authenticator;

namespace WebApplication4
{
    public partial class GoogleLogin : System.Web.UI.Page
    {
        static string baglanstr = "workstation id=halisaha.mssql.somee.com;packet size=4096;user id=sqRa_SQLLogin_1;pwd=lcmc2rgtt6;data source=halisaha.mssql.somee.com;persist security info=False;initial catalog=halisaha";
        SqlConnection baglanti = new SqlConnection(baglanstr);
        SqlCommand komut = new SqlCommand();

        public class GoogleProfile
        {
            public string Id { get; set; }
            public string DisplayName { get; set; }
            public Image Image { get; set; }
            public List<Email> Emails { get; set; }
            public string Gender { get; set; }
            public string ObjectType { get; set; }
        }

        public class Email
        {
            public string Value { get; set; }
            public string Type { get; set; }
        }

        public class Image
        {
            public string Url { get; set; }
        }

        // BEGIN functions
        private void idToSession()
        {
            string mail = (string)Session["mail"];
            baglanti.Open();
            komut.Connection = baglanti;
            komut.CommandText = "SELECT kullaniciID FROM kullanici where kullaniciMail=@email";
            komut.Parameters.AddWithValue("@email", labelEmail.Text);
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
        // END functions

        protected void Page_Load(object sender, EventArgs e)
        {
            GoogleConnect.ClientId = "61887612183-e7q4pgf205etss30qa63k366gdvrefbu.apps.googleusercontent.com";
            GoogleConnect.ClientSecret = "9h3v1H0ji6pPrMmgw-R05m0D";

            GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
            {

                string code = Request.QueryString["code"];
                string json = GoogleConnect.Fetch("me", code);
                GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
                labelID.Text = profile.Id;
                labelName.Text = profile.DisplayName;
                labelEmail.Text = profile.Emails.Find(email => email.Type == "account").Value;
                labelGender.Text = profile.Gender;
                type.Text = profile.ObjectType;
                profilImage.ImageUrl = profile.Image.Url;
                panelProfil.Visible = true;
                btnLogin.Enabled = false;
                //string mail = profile.Emails.Find(email => email.Type == "account").Value;
                //mailLabel.Text = profile.Emails.Find(email => email.Type == "account").Value;
                //Session["mail"] = profile.Emails.Find(email => email.Type == "account").Value;

            }
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            GoogleConnect.Authorize("profile", "email");
            
        }

        protected void butonSave_Click(object sender, EventArgs e)
        {
            string code = (string)Session["qrCode"];
            string email = labelEmail.Text;

            if (!checkEmailUnique(email))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alreadyExistsEmail()", true);
                return;
            }

            string mevki = string.Empty;

            if (rbtnKaleci.Checked)
            {
                mevki = "Kaleci";
            }
            else if (rbtnDefans.Checked)
            {
                mevki = "Defans";
            }
            else if (rbtnOrtaSaha.Checked)
            {
                mevki = "OrtaSaha";
            }
            else if (rbtnForvet.Checked)
            {
                mevki = "Forvet";
            }

            komut.CommandText = "INSERT INTO kullanici (kullaniciID, kullaniciAdSoyad, kullaniciSifre, kullaniciMail, kullaniciTel, kullaniciDogum," +
                        " kullaniciMevki) VALUES (@id, @adsoyad, @sifre, @email, @phone, @dogum, @mevki)";
            komut.Parameters.AddWithValue("@id", textKullaniciID.Text);
            komut.Parameters.AddWithValue("@adsoyad", labelName.Text);
            komut.Parameters.AddWithValue("@sifre", labelID.Text);
            komut.Parameters.AddWithValue("@email", email);
            komut.Parameters.AddWithValue("@phone", textKullaniciTel.Text);
            komut.Parameters.AddWithValue("@dogum", textKullaniciDogum.Text);
            komut.Parameters.AddWithValue("@mevki", mevki);

            komut.Connection = baglanti;
            baglanti.Open();
            komut.ExecuteNonQuery();
            baglanti.Close();
            //Response.Redirect("GoogleLogin.aspx");
            //Response.Redirect("default.aspx");
            //GoogleConnect.Clear(Request.QueryString["code"]);

            TwoFactorAuthenticator tfa = new TwoFactorAuthenticator();
            var setupInfo = tfa.GenerateSetupCode("Halisaha", "Halisaha", "f729877b2b104d0eb717610e9cf7a532-" + labelID.Text, 300, 300);
            string qr = setupInfo.QrCodeSetupImageUrl;
            string key = setupInfo.ManualEntryKey;
            Session["qrCode"] = qr.ToString();
            qrCode.Src = qr.ToString();
        }

        protected void btnEntry_Click(object sender, EventArgs e)
        {
            string mail = (string)Session["mail"];
            komut.CommandText = "SELECT COUNT(*) FROM kullanici where kullaniciMail=@mail";
            komut.Parameters.AddWithValue("@mail", labelEmail.Text);
            komut.Connection = baglanti;
            baglanti.Open();
            komut.ExecuteNonQuery();
            int count = Convert.ToInt32(komut.ExecuteScalar());
            //idToSession();
            Session["userID"] = labelID.Text;
            baglanti.Close();

            if (count >= 1)
            {
                panelProfil.Visible = true;
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