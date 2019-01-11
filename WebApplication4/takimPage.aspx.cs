using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.Data;

namespace WebApplication4
{
    public partial class takimPage : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();
        static string baglanstr = "workstation id=halisaha.mssql.somee.com;packet size=4096;user id=sqRa_SQLLogin_1;pwd=lcmc2rgtt6;data source=halisaha.mssql.somee.com;persist security info=False;initial catalog=halisaha";
        SqlConnection baglanti = new SqlConnection(baglanstr);
        SqlCommand komut = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                veriBagla();
            }
                
            



        }
        protected void karsilastir1()
        {
            baglanti.Open();
            string takimAd = (string)Session["takimAd"];
            string takımOyuncuAd = (string)Session["oyuncuID"];
            komut.CommandText = "SELECT COUNT(1) FROM kullanici where takimOyuncuAd=@takimOyuncuAd1 AND takimAd=@takimAd";
            komut.Parameters.AddWithValue("@takimOyuncuAd1", takımOyuncuAd);
            komut.Parameters.AddWithValue("@takimAd", takimAd);
            komut.Connection = baglanti;
            komut.ExecuteNonQuery();
            int count = Convert.ToInt32(komut.ExecuteScalar());

            if (count == 1)
            {

                Session["karsilastir"] = "zatenvar";
                //ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sweetalertclick()", true);
            }
            else
            {
                Session["karsilastir"] = "zatenyok";

            }

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
        public Boolean OyuncuKontrol(string takimOyuncuAd)
        {
            string takımOyuncuAd = (string)Session["oyuncuID"];
            bool sonuc = false;
            komut.CommandText = "SELECT COUNT(1) FROM takimOyunculars where takimOyuncuAd=@takimOyuncuAd";
            komut.Parameters.AddWithValue("@takimOyuncuAd", takimOyuncuAd);
            int count = Convert.ToInt32(komut.ExecuteScalar());

            if (count == 1)
            {
                if (baglanti.State == ConnectionState.Closed)
                {
                    baglanti.Open();
                }
                sonuc = Convert.ToBoolean(komut.ExecuteNonQuery());
            }
            return sonuc;

        }
        protected void oyuncuKontrol()
        {


            string takımOyuncuAd = (string)Session["oyuncuID"];
            komut.CommandText = "SELECT COUNT(1) FROM takimOyunculars where takimOyuncuAd=@takimOyuncuAd";
            komut.Parameters.AddWithValue("takimOyuncuAd", takımOyuncuAd);
            komut.Connection = baglanti;
            baglanti.Open();
            int count = Convert.ToInt32(komut.ExecuteScalar());
            if (count != 1)
            {
                string takimAd = (string)Session["takimAd"];
                string takımOyuncuMevki = (string)Session["oyuncuMevki"];
                komut.CommandText = "INSERT INTO takimOyunculars (takimAd,takimOyuncuAd,takimOyuncuMevki) VALUES (@takimAd, @takımOyuncuAd, @takımOyuncuMevki)";
                komut.Parameters.AddWithValue("@takimAd", takimAd);
                komut.Parameters.AddWithValue("@takımOyuncuAd", takımOyuncuAd);
                komut.Parameters.AddWithValue("@takımOyuncuMevki", takımOyuncuMevki);
                komut.Connection = baglanti;
                komut.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "oyuncuEkleme2()", true);
                Response.Redirect("takimPage.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sweetalertclick3()", true);
            }


        }
        protected void veriBagla()
        {
            takimAdGetir();
            SqlDataReader dr;
            string takimAd = (string)Session["takimAd"];
            komut.Connection = baglanti;
            try
            {
                baglanti.Open();
                komut.CommandText = ("SELECT takimAd, takimOyuncuAd, takimOyuncuMevki FROM takimOyunculars WHERE takimAd=@takimAd");
                komut.Parameters.AddWithValue("@takimAd", takimAd);
                dr = komut.ExecuteReader();
                gridviewYeni.DataSource = dr;
                gridviewYeni.DataBind();
                dr.Close();
                //Response.Redirect("takimPage.aspx");
            }
            catch
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sweetalertclickTakim()", true);
            }

            finally
            {
                baglanti.Close();
            }

        }
        protected void btnEkle_Click(object sender, EventArgs e)
        {
            oyuncuKontrol();
            veriBagla();
            //Response.Redirect("takımolusturma.aspx");
        }


        protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gridview1.Rows[rowIndex];
            string oyuncuAd = row.Cells[1].Text;
            string mevki = row.Cells[2].Text;
            Session["oyuncuID"] = oyuncuAd.ToString();
            Session["oyuncuMevki"] = mevki.ToString();
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('name: "+ oyuncuAd +"')", true);
        }
        protected void kontrol()
        {
            string deneme = (string)Session["userID"];
            komut.CommandText = "SELECT COUNT(1) FROM takimlar where takimOlusturan=@deneme ";
            komut.Parameters.AddWithValue("@deneme", deneme);
            komut.Connection = baglanti;

            komut.ExecuteNonQuery();
            int count = Convert.ToInt32(komut.ExecuteScalar());
            if (count == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sweetalertclickTakim()", true);
            }

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            

                
                
                string olusturan = (string)Session["userID"];
                komut.CommandText = "INSERT INTO takimlar (takimAd, takimOlusturan) VALUES (@takim, @olusturan)";
                komut.Parameters.AddWithValue("@takim", TextBox1.Text);
                komut.Parameters.AddWithValue("@olusturan", olusturan);
                baglanti.Open();
                komut.Connection = baglanti;
                komut.ExecuteNonQuery();

            
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successTakim()", true);
            
            
            
                baglanti.Close();
            

           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                baglanti.Open();
                komut.CommandText = "DELETE takimOyunculars WHERE takimOyuncuAd=@takimOyuncuAd";
                komut.Parameters.AddWithValue("takimOyuncuAd", TextBox2.Text);
                komut.Connection = baglanti;
                komut.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sweetalertclick4()", true);
            }
            catch
            {

            }
            finally
            {
                baglanti.Close();
            }
            //Response.Redirect("takımolusturma.aspx");

        }
    }
}