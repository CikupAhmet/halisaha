using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication4
{
    public partial class etkinlik : System.Web.UI.Page
    {
        static string baglanstr = "workstation id=halisaha.mssql.somee.com;packet size=4096;user id=sqRa_SQLLogin_1;pwd=lcmc2rgtt6;data source=halisaha.mssql.somee.com;persist security info=False;initial catalog=halisaha";
        SqlConnection baglanti = new SqlConnection(baglanstr);
        SqlCommand komut = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            takimAdGetir();
            string yapanTakim = (string)Session["takimAd"];
            komut.CommandText = "INSERT INTO takimYorum (yorumYapanTakim, yorumYapilanTakim, yapilanYorum) VALUES (@yapanTakim, @yapilanTakim, @yorum)";
            komut.Parameters.AddWithValue("@yapanTakim", yapanTakim);
            komut.Parameters.AddWithValue("yapilanTakim", DropDownList1.SelectedItem.Value);
            komut.Parameters.AddWithValue("@yorum", TextBox1.Text);
            //komut.Parameters.AddWithValue("@puan", textPuan.Text);
            baglanti.Open();
            komut.Connection = baglanti;
            komut.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect("etkinlik.aspx");
        }

        protected void takimAdGetir()
        {
            try
            {
                baglanti.Open();
                string uID = (string)Session["userID"];
                komut.CommandText = "SELECT takimAd FROM takimlar where takimOlusturan=@takimOlusturan";
                komut.Parameters.AddWithValue("@takimOlusturan", uID);
                komut.Connection = baglanti;

                SqlDataReader dr = komut.ExecuteReader();
                if (dr.Read())
                {
                    Session["takimAd"] = dr["takimAd"].ToString();
                }
            }
            catch
            {

            }
            finally
            {
                baglanti.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string uID = (string)Session["userID"];
            komut.CommandText = "INSERT INTO oyuncuYorum2 (yorumYapanOyuncu, yorumYapilanOyuncu, yapilanYorum, puan) VALUES (@yapanOyuncu, @yapilanOyuncu, @yorum, @puan)";
            komut.Parameters.AddWithValue("@yapanOyuncu", uID);
            komut.Parameters.AddWithValue("yapilanOyuncu", DropDownList2.SelectedItem.Value);
            komut.Parameters.AddWithValue("@yorum", TextBox2.Text);
            komut.Parameters.AddWithValue("@puan", textPuan.Text);
            baglanti.Open();
            komut.Connection = baglanti;
            komut.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect("etkinlik.aspx");
        }

    }
}