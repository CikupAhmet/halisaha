<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uyeOlma.aspx.cs" Inherits="WebApplication4.uyeOlma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Üye Olma</title>
    <link href="/uyeOlmastyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous" />
    <script src="sweetalert.js"></script>
    <link rel="stylesheet" href="sweetalert2.css" />
    <script>
        function sweetalertclick() {
            swal(
                'Kayıt Başarılı',
                'Simdi Giriş Yapabilirsin',
                'success'
            )
        }
        function sweetalertclick2() {
            swal(
                'Kayıt Başarısız',
                'Eksik veya Yanlış Bir Bilgi Girdiniz',
                'error'
            )
        }

        var codeUrl = "";

        //function setCodeUrl(url) {
        //    codeUrl = url;
        //    document.getElementById('qrCode').innerHTML = `<img src="${codeUrl}" />`;
        //}
        function errorCode() {
             swal(
                'Kayıt Başarısız',
                'Qr Code yanlış',
                'error'
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
                        <li style="float:right">
                            <a href="default.aspx" style="margin-right:7px"><i class="fas fa-power-off"></i>&nbsp;Çıkış Yap</a>
                            </li>
                        <li style="float:right">
                            <a href="iletisim2.aspx" ><i class="fas fa-phone-square"></i>&nbsp;İletisim</a>

                        </li>   
                        
                    </ul>
                </nav>

            </header>
        <div class="banner">
             <div class="box">
                <div class="inputlar">
                     <label for="fname">Kullanıcı Adı</label>
                     <asp:TextBox ID="TextBox1" CssClass="inputDeneme"  runat="server"></asp:TextBox>

                     <asp:Label runat="server"> Ad Soyad</asp:Label>
                     <asp:TextBox ID="TextBox2" CssClass="inputDeneme"  runat="server"></asp:TextBox>

                     <asp:Label runat="server"> Şifre</asp:Label><br />
                     <asp:TextBox ID="TextBox3" TextMode="Password" CssClass="inputDeneme"  runat="server"></asp:TextBox>

                     <asp:Label runat="server"> E-Mail</asp:Label>
                     <asp:TextBox ID="TextBox4" CssClass="inputDeneme"  runat="server"></asp:TextBox>

                     <asp:Label runat="server"> Telefon Numarası</asp:Label>
                     <asp:TextBox ID="TextBox5" CssClass="inputDeneme"  runat="server"></asp:TextBox>

                     <asp:Label runat="server"> Doğum Tarihi</asp:Label>
                     <asp:TextBox ID="TextBox6" CssClass="inputDeneme"  runat="server"></asp:TextBox>

                     <asp:Label ID="TextBox7" runat="server">Mevki</asp:Label><br />
                   <%--  <asp:TextBox ID="txtCode"  CssClass="inputDeneme" runat="server"></asp:TextBox>--%>
                     <asp:RadioButton ID="RadioButton1" Text="Kaleci" runat="server" /><br />
                     <asp:RadioButton ID="RadioButton2" Text="Defans" runat="server" /><br />
                     <asp:RadioButton ID="RadioButton3" Text="Ortasaha" runat="server" /><br />
                     <asp:RadioButton ID="RadioButton4" Text="Forvet" runat="server" />
                </div>
                
                <img id="qrCode" runat="server" />
                <asp:Button ID="Button1" runat="server" CssClass="btnKaydet" Text="Kayıt Ol" OnClick="Button1_Click" /> 
                  
             </div>
        </div>
    </div>



    </form>
</body>
</html>
