﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profilim.aspx.cs" Inherits="WebApplication4.profilim" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profilim</title>
    <link href="/profilDüzenleme.css" rel="stylesheet" />
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
                            <a href="default.aspx"><i class="fas fa-home"></i>&nbsp;Ana Sayfa</a>
                        </li>
                        <li style="float:right">
                            <a href="default.aspx" style="margin-right:7px"><i class="fas fa-power-off"></i>&nbsp;Çıkış Yap</a>
                        </li>
                        <li style="float:right">
                            <a href="default.aspx" style="margin-right:7px"><i class="fas fa-phone-square"></i>&nbsp;İletişim</a>
                        </li>
                    </ul>
                </nav>

            </header>
         <div class="banner">
             <div class="bilgiler">
                 
                 
                 <div class="ozellik">
                     <div class="box">
                         <div class="profilfoto">
                             
                             <input type="file" class="takımfoto" value="" />
                         </div>

                         <div class="inputlar">
                         <label for="fname">Ad Soyad</label>
                         <p class="input"><input type="text"  name="adsoyad" placeholder="Adınızı Soyadınızı Giriniz" /></p>
                         <label for="fname">Boy</label>
                         <p class="input"><input type="text"  name="boy" placeholder="Boyunuzu giriniz" /></p>
                         <label for="fname">Doğum Tarihi</label>
                         <p class="input"><input type="date" name="date" /></p>
                         <label for="fname">E-Mail</label>
                         <p class="input"><input type="email" name="e-posta" placeholder="E-Mailinizi Giriniz" /></p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    </form>
</body>
</html>
