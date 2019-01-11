using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Google.Authenticator;
using System.Web.UI.HtmlControls;

namespace WebApplication4
{
    public partial class uyeOlma : System.Web.UI.Page
    {
        static string baglanstr = "workstation id=halisaha.mssql.somee.com;packet size=4096;user id=sqRa_SQLLogin_1;pwd=lcmc2rgtt6;data source=halisaha.mssql.somee.com;persist security info=False;initial catalog=halisaha";
        SqlConnection baglanti = new SqlConnection(baglanstr);
        SqlCommand komut = new SqlCommand();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            //secretCode = generateKod(6);
            //Session["qrCode"] = secretCode.ToString();

           
        //    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "setCodeUrl('"+qr+"')", true);
        }
       
        protected void Button1_Click(object sender, EventArgs e)
        {
             try
             {
                string code = (string)Session["qrCode"];
                //if (txtCode.Text != code)
                //{
                //    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorCode()", true);
                //    return;
                //}
                 string mevki = string.Empty;
                 komut.CommandText = "INSERT INTO kullanici (kullaniciID, kullaniciAdSoyad, kullaniciSifre, kullaniciMail, kullaniciTel, kullaniciDogum," +
                     " kullaniciMevki) VALUES (@id, @adsoyad, @sifre,@mail, @tel, @dogum, @mevki)";
                 komut.Parameters.AddWithValue("@id", TextBox1.Text);
                 komut.Parameters.AddWithValue("@adsoyad", TextBox2.Text);
                 komut.Parameters.AddWithValue("@sifre", TextBox3.Text);
                 komut.Parameters.AddWithValue("@mail", TextBox4.Text);
                 komut.Parameters.AddWithValue("@tel", TextBox5.Text);
                 komut.Parameters.AddWithValue("@dogum", TextBox6.Text);
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
                 komut.Parameters.AddWithValue("@mevki", mevki);
                 komut.Connection = baglanti;
                 baglanti.Open();
                 komut.ExecuteNonQuery();

               //  ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sweetalertclick()", true);
                TwoFactorAuthenticator tfa = new TwoFactorAuthenticator();
                var setupInfo = tfa.GenerateSetupCode("Halisaha", "Halisaha", "f729877b2b104d0eb717610e9cf7a532-"+TextBox1.Text, 300, 300);
                string qr = setupInfo.QrCodeSetupImageUrl;
                string key = setupInfo.ManualEntryKey;
                Session["qrCode"] = qr.ToString();
                qrCode.Src = qr.ToString();

            }
             catch
             {
                 ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sweetalertclick2()", true);
             }
            
        }

        private static Random random = new Random();

        private string generateKod(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}