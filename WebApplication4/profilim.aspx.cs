using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication4
{
    public partial class profilim : System.Web.UI.Page
    {
        
        static string baglanstr = "workstation id=halisaha.mssql.somee.com;packet size=4096;user id=sqRa_SQLLogin_1;pwd=lcmc2rgtt6;data source=halisaha.mssql.somee.com;persist security info=False;initial catalog=halisaha";
        SqlConnection baglanti = new SqlConnection(baglanstr);
        SqlCommand komut = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

            
            
                bilgiGetir();
            


        }

        protected void bilgiGetir()
        {
            string uID = (string)Session["userID"];
            string deneme = uID.ToString();
            baglanti.Open();
            komut.Connection = baglanti;
            komut.CommandText = "SELECT kullaniciAdSoyad, kullaniciMail,kullaniciTel, kullaniciDogum, kullaniciMevki FROM kullanici where kullaniciID=@id";
            komut.Parameters.AddWithValue("@id", uID);
            komut.ExecuteNonQuery();

            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                Label1.Text = dr["kullaniciAdSoyad"].ToString();
                Label2.Text = dr["kullanicimail"].ToString();
                Label3.Text = dr["kullaniciTel"].ToString();
                Label4.Text = dr["kullaniciDogum"].ToString();
                Label5.Text = dr["kullaniciMevki"].ToString();


            }
        }
    }
}