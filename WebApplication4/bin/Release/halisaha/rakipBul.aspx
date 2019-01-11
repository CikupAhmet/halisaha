<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rakipBul.aspx.cs" Inherits="WebApplication4.rakipBul" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rakip Bul</title>
    <link href="rakipBul.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <script src="sweetalert.js"></script>
    <link rel="stylesheet" href="sweetalert2.css" />
    <script>
        function sweetalertclick() {

            
            Swal({
                type: 'error',
                title: 'Ahmet',
                text: 'Something went wrong!',
                footer: '<a href>Why do I have this issue?</a>'
            })
             
        }
    </script>
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
         <div class="banner">
             <div class="takımListe">
                
                    <asp:Label ID="Label1" runat="server" ForeColor="white" Visible="false"></asp:Label>
                 <h3 style="text-align: center; color:white; font-family: 'Trebuchet MS', Arial, 'Comic Sans MS'; border-bottom: 2px solid #d4c3c3;">Takım Listesi</h3>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" OnRowCommand="GridView1_RowCommand" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource3" Width="610px">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="takimAd" HeaderText="takimAd" SortExpression="takimAd" />
                            <asp:BoundField DataField="takimOlusturan" HeaderText="takimOlusturan" SortExpression="takimOlusturan" />
                        </Columns>
                        
                    </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:halisahaConnectionString %>" SelectCommand="SELECT [takimAd], [takimOlusturan] FROM [takimlar]"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:uyelerConnectionString %>" SelectCommand="SELECT [takimAd], [takimOlusturan] FROM [takimlar]"></asp:SqlDataSource>
                    <asp:Button ID="Button1" runat="server" Text="Eşleş" CssClass="btnesles"  OnClick="Button1_Click" />
                    <h3 style="text-align: center; color:white; font-family: 'Trebuchet MS', Arial, 'Comic Sans MS'; border-bottom: 2px solid #d4c3c3; margin-top:5px;">Takım Listesi</h3>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" DataSourceID="SqlDataSource4" Width="610px" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="takim1" HeaderText="takim1" SortExpression="takim1" />
                            <asp:BoundField DataField="takim2" HeaderText="takim2" SortExpression="takim2" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:halisahaConnectionString %>" SelectCommand="SELECT [takim1], [takim2] FROM [eslesme]"></asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:uyelerConnectionString %>" SelectCommand="SELECT [takim1], [takim2] FROM [eslesme]"></asp:SqlDataSource>

                 
             </div>

         </div>
    </div>
    </form>
</body>
</html>
