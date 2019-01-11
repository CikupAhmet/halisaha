using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Data.SqlClient;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;
using Google.Authenticator;

namespace WebApplication4
{
    public partial class _default : Page
    {
        public static class MyGlobals
        {
            public static String kullaniciBilgi;
        }
       
        static string baglanstr = "workstation id=halisaha.mssql.somee.com;packet size=4096;user id=sqRa_SQLLogin_1;pwd=lcmc2rgtt6;data source=halisaha.mssql.somee.com;persist security info=False;initial catalog=halisaha";
        SqlConnection baglanti = new SqlConnection(baglanstr);
        SqlCommand komut = new SqlCommand();
        
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
                Session["mail"] = profile.Emails.Find(email => email.Type == "account").Value;
                
            }
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            girisKontrol();
            
        }

        protected void girisKontrol()
        {
            komut.CommandText = "SELECT COUNT(1) FROM kullanici where kullaniciID=@id AND kullaniciSifre=@sifre";
            komut.Parameters.AddWithValue("@id", kullaniciIDText.Text);
            komut.Parameters.AddWithValue("@sifre", kullaniciSifreText.Text);
            komut.Connection = baglanti;
            baglanti.Open();
            komut.ExecuteNonQuery();
           
            if ((kullaniciIDText.Text == "") & (kullaniciSifreText.Text == ""))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "hataMesaj2()", true);
            }
            
            else
            {
                int count = Convert.ToInt32(komut.ExecuteScalar());
                //id();
                Session["userID"] = kullaniciIDText.Text.ToString();

                if (count == 1)
                {
                    profilPanel.Visible = true;
                   // Response.Redirect("anaSayfa.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "hataMesaj()", true);

                }
                baglanti.Close();
            }
        }
        
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
    
        protected void giris(object sender,EventArgs e)
        {
            Response.Redirect("GoogleLogin.aspx"); 
        }
        protected void idgetir()
        {
            string mail = (string)Session["mail"];
            baglanti.Open();
            komut.Connection = baglanti;
            komut.CommandText = "SELECT kullaniciID FROM kullanici where kullaniciMail=@mail";
            komut.Parameters.AddWithValue("@mail", kullaniciIDText.Text);
            komut.ExecuteNonQuery();
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                Session["userID"] = dr["kullaniciID"].ToString();
            }
        }

        public void control()
        {
            string uID = (string)Session["userID"];
            TwoFactorAuthenticator tfa = new TwoFactorAuthenticator();
            bool isValid = tfa.ValidateTwoFactorPIN("f729877b2b104d0eb717610e9cf7a532-" + uID, txtcode.Text);
            if (isValid)
            {
                idgetir();
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