<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="etkinlik.aspx.cs" Inherits="WebApplication4.etkinlik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Etkinlik</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <link href="etkinlik.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <header>
                <div class="logo">
                    LOGO
                </div>

                <nav class="nav">
                    <ul>
                        <li>
                            <a href="anaSayfa.aspx"><i class="fas fa-home"></i>&nbsp;Ana Sayfa</a>
                        </li>
                        <li style="float:right">
                            <a href="default.aspx" style="margin-right:7px"><i class="fas fa-power-off"></i>&nbsp;Çıkış Yap</a>
                        </li>
                        <li style="float:right">
                            <a href="iletisim.aspx" style="margin-right:7px"><i class="fas fa-phone-square"></i>&nbsp;İletişim</a>
                        </li>
                    </ul>
                </nav>

            </header>
            <div class="takimYorum">
                <div class="takimİsim">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="takimAd" DataValueField="takimAd" Width="150px"  Height="35px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:halisahaConnectionString %>" SelectCommand="SELECT [takimAd] FROM [takimlar]"></asp:SqlDataSource>
                    
                </div>

                <asp:TextBox ID="TextBox1" runat="server" CssClass="yorumDalga"  Rows="2"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CssClass="btnYorum" Text="Yorum Yap" OnClick="Button1_Click" />
                <h3 style="text-align: center; font-family: 'Trebuchet MS', Arial, 'Comic Sans MS'; border-bottom: 2px solid #d4c3c3;">Yorumlar</h3>
                <div class="box">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource5" Width="290px">
                    <Columns>
                        <asp:BoundField DataField="yorumYapanTakim" HeaderText="YapanTakim" SortExpression="yorumYapanTakim" />
                        <asp:BoundField DataField="yorumYapilanTakim" HeaderText="YapilanTakim" SortExpression="yorumYapilanTakim" />
                        <asp:BoundField DataField="yapilanYorum" HeaderText="Yorum" SortExpression="yapilanYorum" />
                    </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:halisahaConnectionString %>" SelectCommand="SELECT [yorumYapanTakim], [yorumYapilanTakim], [yapilanYorum] FROM [takimYorum]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:uyelerConnectionString %>" SelectCommand="SELECT [yorumYapanTakim], [yorumYapilanTakim], [yapilanYorum] FROM [takimYorum]"></asp:SqlDataSource>
                </div>
            </div>
            <div class="oyuncuYorum">
                <div class="oyuncuİsim">
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="kullaniciAdSoyad" DataValueField="kullaniciAdSoyad" Width="150px" Height="35px"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:halisahaConnectionString %>" SelectCommand="SELECT [kullaniciAdSoyad] FROM [kullanici]"></asp:SqlDataSource>
                    
                </div>
                <asp:TextBox ID="TextBox2"  runat="server" CssClass="yorumDalga2" Rows="2"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" CssClass="btnYorum2" Text="Yorum Yap" OnClick="Button2_Click" />
                <h3 style="text-align: center; font-family: 'Trebuchet MS', Arial, 'Comic Sans MS'; border-bottom: 2px solid #d4c3c3; ">Yorumlar</h3>
                <div class="box2">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" Width="290px">
                    <Columns>
                        <asp:BoundField DataField="yorumYapanOyuncu" HeaderText="YapanOyuncu" SortExpression="yorumYapanOyuncu" />
                        <asp:BoundField DataField="yorumYapilanOyuncu" HeaderText="YapilanOyuncu" SortExpression="yorumYapilanOyuncu" />
                        <asp:BoundField DataField="yapilanYorum" HeaderText="Yorum" SortExpression="yapilanYorum" />
                    </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:halisahaConnectionString %>" SelectCommand="SELECT [yorumYapanOyuncu], [yorumYapilanOyuncu], [yapilanYorum] FROM [oyuncuYorum]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:uyelerConnectionString %>" SelectCommand="SELECT [yorumYapanOyuncu], [yorumYapilanOyuncu], [yapilanYorum] FROM [oyuncuYorum]"></asp:SqlDataSource>
                </div>
             </div>
        </div>
    </form>
</body>
</html>
