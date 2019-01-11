<%@ Page Language="C#" AutoEventWireup="true" Codebehind="anaSayfa.aspx.cs" Inherits="WebApplication4.anaSayfa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ana Sayfa</title>
    <link href="/mainStyle.css" rel="stylesheet" />
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
                        <li>
                            <a href="takimPage.aspx">Takımım</a>
                        </li>
                        <li>
                            <a href="rezervasyon.aspx">Halısahalar</a>
                        </li>
                        <li>
                            <a href="etkinlik.aspx"><i class="far fa-comment"></i>&nbsp;Etkinlik</a>
                        </li>
                        <li style="float:right">
                            <a href="default.aspx" style="margin-right:7px"><i class="fas fa-power-off"></i>&nbsp;Çıkış Yap</a>
                        </li>
                        <li style="float:right">
                            <a href="iletisim.aspx" style="margin-right:7px"><i class="fas fa-phone-square"></i>&nbsp;İletişim</a>
                        </li>
                        <li style="float:right">
                            <i class="fas fa-user-circle"></i>&nbsp;<asp:Label runat="server"  ID="profilLabel" ForeColor="White"></asp:Label>
                        </li>
                    </ul>
                </nav>

            </header>

        <div class="banner">
             <div class="box">
                 
                 <h2></h2>
                 <div class="takım"> 
                     <a href="takimPage.aspx">
                         <h3 style="text-align:center;">Takımım</h3>                   
                    <input type="button" class="btntakımım" value="" />
                     </a>
                 </div>
                 <div class="halısaha">
                     <a href="rezervasyon.aspx">
                         <h3 style="text-align:center;">Halı Saha</h3>                      
                    <input type="button" class="btnhalısaha" value="" />
                    </a>
                 </div>
                 <div class="rakip">
                     <a href="rakipBul.aspx">
                         <h3 style="text-align:center;">Rakip Bul</h3>   
                    <input type="button" class="btnrakipbul" value="" />
                    </a>
                 </div>

                 <div class="profil">
                    <a href="profilim.aspx"> 
                        <h3 style="text-align:center;">Profilim</h3>                   
                    <input type="button" class="btnprofilim" value="" />
                    </a>
                 </div>              
             </div>
        </div>
    </div>
    </form>
</body>
</html>
