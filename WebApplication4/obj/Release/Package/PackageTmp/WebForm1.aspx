<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication4.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Google ile Giriş Yap</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <meta name="google-signin-client_id" content="61887612183-e7q4pgf205etss30qa63k366gdvrefbu.apps.googleusercontent.com"/>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="google2.js"></script>
    <style>
        .data{
            display:none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        

        <div>
            <div  class="g-signin2" data-onsuccess="onSignIn" data-longtitle="true"> </div>
            
       
            <asp:Label ID="email"  runat="server"></asp:Label>

            <div class="data">
                <p>Profil Bilgileri</p>
                <img id="pic" class="img-circle" width="100" height="100" />
                     <label for="fname">Kullanıcı Adı</label>
                     <asp:TextBox ID="TextBox1" CssClass="inputDeneme"  runat="server"></asp:TextBox>
                     <asp:Label runat="server"> Şifre</asp:Label>
                     <asp:TextBox ID="TextBox3" CssClass="inputDeneme"  runat="server"></asp:TextBox>
                     <asp:Label runat="server"> Telefon Numarası</asp:Label>
                     <asp:TextBox ID="TextBox5" CssClass="inputDeneme"  runat="server"></asp:TextBox>
                     <asp:Label runat="server"> Doğum Tarihi</asp:Label>
                     <asp:TextBox ID="TextBox6" CssClass="inputDeneme"  runat="server"></asp:TextBox>
                     <asp:Label ID="TextBox7" runat="server">Mevki</asp:Label><br />
                     <asp:RadioButton ID="RadioButton1" Text="Kaleci" runat="server" /><br />
                     <asp:RadioButton ID="RadioButton2" Text="Defans" runat="server" /><br />
                     <asp:RadioButton ID="RadioButton3" Text="Ortasaha" runat="server" /><br />
                     <asp:RadioButton ID="RadioButton4" Text="Forvet" runat="server" />
                <p>Email</p>
                
            
                

                <button onclick="signOut()" class="btn btn-danger">Girişe Devam et</button>
                <asp:Button runat="server" ID="btnKaydet" OnClick="btnKaydet_Click" Text="Kayıt Ol"/>     
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Label ID="Label2" runat="server" ></asp:Label>
                <asp:Label ID="Label3" runat="server" ></asp:Label>
            </div>
            
        </div>
        



    </form>
</body>
</html>
