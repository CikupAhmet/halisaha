using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication4
{
    public partial class rakipBul : System.Web.UI.Page
    {
        static string baglanstr = "workstation id=halisaha.mssql.somee.com;packet size=4096;user id=sqRa_SQLLogin_1;pwd=lcmc2rgtt6;data source=halisaha.mssql.somee.com;persist security info=False;initial catalog=halisaha";
        SqlConnection baglanti = new SqlConnection(baglanstr);
        SqlCommand komut = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            string uID = (string)Session["userID"];
            //Label1.Text = uID.ToString();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[rowIndex];
            string takimAd1 = row.Cells[1].Text;
            Session["takimAd1"] = takimAd1.ToString();
        }
        protected void takimEsles()
        {
            try
            {
                baglanti.Open();
                komut.Connection = baglanti;

                string takimAd1 = (string)Session["takimAd1"];
                string olusturan = (string)Session["userID"];
                komut.CommandText = "SELECT takimAd FROM takimlar WHERE takimOlusturan=@takimOlusturan";
                komut.Parameters.AddWithValue("@takimOlusturan", olusturan);
                SqlDataReader dr = komut.ExecuteReader();
                dr.Read();
                Session["takimAd2"] = dr["takimAd"].ToString();
            }
            catch
            {
                
            }
            finally
            {
                baglanti.Close();
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                takimAdGetir();
                baglanti.Open();

                string takim1 = (string)Session["takimAd1"];
                string takim2 = (string)Session["takimAd"];
                komut.CommandText = "INSERT INTO eslesme (takim1, takim2) VALUES (@takim1, @takim2)";
                komut.Parameters.AddWithValue("@takim1", takim1);
                komut.Parameters.AddWithValue("@takim2", takim2);
                komut.Connection = baglanti;
                komut.ExecuteNonQuery();
                baglanti.Close();

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sweetalertclick()", true);

            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sweetalertclick2()", true);
            }
            finally
            {
                baglanti.Close();
            }


        }
    }
}