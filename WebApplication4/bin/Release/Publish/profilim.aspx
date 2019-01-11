<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profilim.aspx.cs" Inherits="WebApplication4.profilim" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profilim</title>
    <link href="/profilimStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">


   
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
             <div class="bilgiler">
                 
                 
                 <div class="ozellik">
                     <div class="box">
                         
                         <div style="font-size:40px; text-align:center; top:50%" >
                            <asp:Label CssClass="deneme" ID="Label1" runat="server" Text="Label" Font-Size="Medium" ForeColor="White"></asp:Label><br />
                            <asp:Label CssClass="deneme" ID="Label2" runat="server" Text="Label" Font-Size="Medium" ForeColor="White"></asp:Label><br />
                            <asp:Label CssClass="deneme" ID="Label3" runat="server" Text="Label" Font-Size="Medium" ForeColor="White"></asp:Label><br />
                            <asp:Label CssClass="deneme" ID="Label4" runat="server" Text="Label" Font-Size="Medium" ForeColor="White"></asp:Label><br />
                            <asp:Label CssClass="deneme" ID="Label5" runat="server" Text="Label" Font-Size="Medium" ForeColor="White"></asp:Label><br />
                         </div>
                         
                         
                     </div>
                 </div>
             </div>
         </div>

        
    </div>
    </form>
</body>
</html>
