<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="takımolusturma.aspx.cs" Inherits="WebApplication4.takımolusturma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Takım Oluşturma</title>
    <link href="/takımolusturma.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="sweetalert.js"></script>
    <link rel="stylesheet" href="sweetalert2.css" />
    <script>
        function oyuncuEkleme() {
            Swal({
             type: 'error',
             title: 'Oops...',
             text: 'Yanlış Kullanıcı Adı veya Şifre'
            })
        }
        function sweetalertclickTakim() {
            Swal({
                type: 'info',
                title: 'Oops...',
                text: 'Öncelikle Takım Ouşturmalısın'
            })
        }
        
        function sweetalertclick3() {
            Swal({
                type: 'error',
                title: 'Oops...',
                text: 'Eklemek İstediğiniz Oyuncu Zaten Bir Takıma Üye!',
                })
        }
        function sweetalertclick4() {
            swal(
                'Başarılı',
                'Oyuncu Silindi',
                'success'
            )
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
            <div class="takımbilgi">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="takimText"></asp:TextBox>
                
                <asp:Button ID="Button1" runat="server" Text="Takım Oluştur" CssClass="takımolusturbtn" OnClick="Button1_Click" />
                
            </div>
            <div class="oyunculistesi">
                <input type="search" class="arama"  placeholder=" Oyuncu ara..."/>
                <input type="button" class="aramabtn" value="Ara" />
                <br />
                <asp:GridView runat="server" ID="gridview1" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="gridview1_RowCommand" Width="359px" Height="279px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="kullaniciAdSoyad" HeaderText="Oyuncu Adı" SortExpression="kullaniciAdSoyad" />
                        <asp:BoundField DataField="kullaniciMevki" HeaderText="Oyuncu Mevki" SortExpression="kullaniciMevki" />
                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:uyelerConnectionString %>" SelectCommand="SELECT [kullaniciAdSoyad], [kullaniciMevki] FROM [kullanici]"></asp:SqlDataSource>
                <p style="border-bottom: 2px solid #333;">
                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>   
                </p>
                <asp:Button  runat="server" ID="btnEkle" Text="Oyuncu Ekle" CssClass="butonEkle" OnClick="btnEkle_Click"/>
                     
                
            </div>
                    
            <asp:GridView ID="gridviewYeni" runat="server"  Width="600px">

            </asp:GridView>
            <h3 style="text-align: center; font-family'Trebuchet MS', Arial, 'Comic Sans MS'; border-bottom: 2px solid #d4c3c3">Oyuncu Silme</h3>
            <asp:TextBox ID="TextBox2" CssClass="textSilme" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Oyuncu Sil" CssClass="oyuncuSil" OnClick="Button2_Click" />       
        </div>
        
    </div>
    </form>
</body>
</html>
