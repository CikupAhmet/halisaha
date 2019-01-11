using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Data.SqlClient;

namespace WebApplication4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        static string baglanstr = "Data Source=DESKTOP-I8UU1NR;Initial Catalog=uyeler;Integrated Security=True;";
        SqlConnection baglanti = new SqlConnection(baglanstr);
        SqlCommand komut = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = (string)Session["username"];
            string emaill = (string)Session["email"];
            Label2.Text = username;
            Label3.Text = emaill;
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string username = (string)Session["username"];
            string emaill = (string)Session["email"];
            string mevki = string.Empty;
            
         

            komut.CommandText = "INSERT INTO kullanici (kullaniciID, kullaniciAdSoyad, kullaniciSifre, kullaniciMail, kullaniciTel, kullaniciDogum," +
                    " kullaniciMevki) VALUES (@id, @adsoyad, @sifre,@mail, @tel, @dogum, @mevki)";
            komut.Parameters.AddWithValue("@id", TextBox1.Text);
            komut.Parameters.AddWithValue("@adsoyad", Label2.Text);
            komut.Parameters.AddWithValue("@sifre", TextBox3.Text);
            komut.Parameters.AddWithValue("@mail", Label3.Text);
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



        }
    }
}