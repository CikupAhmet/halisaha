using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Data;

namespace WebApplication4
{
    public partial class rezervasyon : System.Web.UI.Page
    {
        static string baglanstr = "workstation id=halisaha.mssql.somee.com;packet size=4096;user id=sqRa_SQLLogin_1;pwd=lcmc2rgtt6;data source=halisaha.mssql.somee.com;persist security info=False;initial catalog=halisaha";
        SqlConnection baglanti = new SqlConnection(baglanstr);
        SqlCommand komut = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            getName1();
            getName2();
            getName3();
            getName4();
            getName5();
            getName6();
            getName7();
            getName8();
        }

        

        public void getName1()
        {
            if(baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            komut.CommandText = "SELECT butonRezerve FROM rezervasyon WHERE butonID = 'Button1' ";
            baglanti.Open();
            komut.Connection = baglanti;
            SqlDataReader dr = komut.ExecuteReader();
            
            if (dr.Read())
            { 
                btn1.Text = dr["butonRezerve"].ToString();
                baglanti.Close();
            }
        }
        public void getName2()
        {
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            komut.CommandText = "SELECT butonRezerve FROM rezervasyon WHERE butonID = 'Button2' ";
            baglanti.Open();
            komut.Connection = baglanti;
            SqlDataReader dr = komut.ExecuteReader();

            if (dr.Read())
            {
                btn2.Text = dr["butonRezerve"].ToString();
                baglanti.Close();
            }
        }
        public void getName3()
        {
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            komut.CommandText = "SELECT butonRezerve FROM rezervasyon WHERE butonID = 'Button3' ";
            baglanti.Open();
            komut.Connection = baglanti;
            SqlDataReader dr = komut.ExecuteReader();

            if (dr.Read())
            {
                btn3.Text = dr["butonRezerve"].ToString();
                baglanti.Close();
            }
        }
        public void getName4()
        {
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            komut.CommandText = "SELECT butonRezerve FROM rezervasyon WHERE butonID = 'Button4' ";
            baglanti.Open();
            komut.Connection = baglanti;
            SqlDataReader dr = komut.ExecuteReader();

            if (dr.Read())
            {
                btn4.Text = dr["butonRezerve"].ToString();
                baglanti.Close();
            }
        }
        public void getName5()
        {
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            komut.CommandText = "SELECT butonRezerve FROM rezervasyon WHERE butonID = 'Button5' ";
            baglanti.Open();
            komut.Connection = baglanti;
            SqlDataReader dr = komut.ExecuteReader();

            if (dr.Read())
            {
                btn5.Text = dr["butonRezerve"].ToString();
                baglanti.Close();
            }
        }
        public void getName6()
        {
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            komut.CommandText = "SELECT butonRezerve FROM rezervasyon WHERE butonID = 'Button6' ";
            baglanti.Open();
            komut.Connection = baglanti;
            SqlDataReader dr = komut.ExecuteReader();

            if (dr.Read())
            {
                btn6.Text = dr["butonRezerve"].ToString();
                baglanti.Close();
            }
        }
        public void getName7()
        {
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            komut.CommandText = "SELECT butonRezerve FROM rezervasyon WHERE butonID = 'Button7' ";
            baglanti.Open();
            komut.Connection = baglanti;
            SqlDataReader dr = komut.ExecuteReader();

            if (dr.Read())
            {
                btn7.Text = dr["butonRezerve"].ToString();
                baglanti.Close();
            }
        }
        public void getName8()
        {
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            komut.CommandText = "SELECT butonRezerve FROM rezervasyon WHERE butonID = 'Button8' ";
            baglanti.Open();
            komut.Connection = baglanti;
            SqlDataReader dr = komut.ExecuteReader();

            if (dr.Read())
            {
                btn8.Text = dr["butonRezerve"].ToString();
                baglanti.Close();
            }
        }

        public void guncelle(string butonId)
        {
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            baglanti.Open();
            komut.CommandText = "UPDATE rezervasyon SET butonRezerve='Rezerve', butonRenk='red' WHERE butonID=@butonId";
            //komut.Parameters.AddWithValue("@butonId", butonId);
            komut.Connection = baglanti;
            komut.ExecuteNonQuery();
            baglanti.Close();
        }

        public void guncelleYeni(string butonId)
        {
            baglanti.Open();
            komut.CommandText = "UPDATE rezervasyon SET butonRezerve='Rezerve Et', butonRenk='green' WHERE butonID=@butonId";
            //komut.Parameters.AddWithValue("@butonId", butonId);
            komut.ExecuteNonQuery();
            baglanti.Close();
        }

        protected void kontrol(string butonId)
        {
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            komut.CommandText = "SELECT butonRezerve FROM rezervasyon WHERE butonID=@butonId";
            komut.Parameters.AddWithValue("@butonId",butonId);
            baglanti.Open();
            komut.Connection = baglanti;
            SqlDataReader dr = komut.ExecuteReader();

            if (dr.Read())
            {
                Session["butonRezerve"] = dr["butonRezerve"].ToString();
                string butonRez = (string)Session["butonRezerve"];
                baglanti.Close();
                if(butonRez == "Rezerve Et")
                {

                    guncelle(butonId);

                }
                else
                {
                    guncelleYeni(butonId);
                }
            }
            
            //degistir(butonId);
            baglanti.Close();

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string btn1 = "Button1";
            kontrol(btn1);
            Response.Redirect("rezervasyon.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string btn2 = "Button2";
            kontrol(btn2);
            Response.Redirect("rezervasyon.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string btn3 = "Button3";
            //guncelle(btn3);
            kontrol(btn3);
            Response.Redirect("rezervasyon.aspx");
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            string btn4 = "Button4";
            kontrol(btn4);
            Response.Redirect("rezervasyon.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            string btn5 = "Button5";
            kontrol(btn5);
            Response.Redirect("rezervasyon.aspx");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            string btn6 = "Button6";
            kontrol(btn6);
            Response.Redirect("rezervasyon.aspx");
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            string btn7 = "Button7";
            kontrol(btn7);
            Response.Redirect("rezervasyon.aspx");
        }
        protected void Button8_Click(object sender, EventArgs e)
        {
            string btn8 = "Button8";
            kontrol(btn8);
            Response.Redirect("rezervasyon.aspx");
        }
    }
}