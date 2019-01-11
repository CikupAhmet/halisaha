<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rezervasyon.aspx.cs" Inherits="WebApplication4.rezervasyon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Halı Saha Rezervasyon</title>
    <link href="/rezervasyonstyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.0/css/all.css" integrity="sha384-aOkxzJ5uQz7WBObEZcHvV5JvRW3TUc2rNPA7pe3AwnsUohiw1Vj2Rgx2KSOkF5+h" crossorigin="anonymous">
    <script src="sweetalert.js"></script>
    <link rel="stylesheet" href="sweetalert2.css" />
    <script src="rezervasyon.js"></script>
    <script>
        
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
                            <a href="iletisim.aspx"><i class="fas fa-phone-square"></i>&nbsp;İletişim</a>
                        </li>
                    </ul>
                </nav>

            </header>
           
         <div class="banner">
             <div class="halısahadurumu">
                 <div class="tarihbilgi">
                      <input type="date" name="" style="text-align:center; margin: 17px; width:150px; height: 25px; text-align: center; background-color:grey; float:right; font-style: normal;"  />
                 </div>

                 <div class="durum">
                     <table class="table">
                         <tr>
                             <th  style="background-color: white;"></th>
                             <th class="th">Pzt</th>
                             <th class="th">Sal</th>
                             <th class="th">Çar</th>
                             <th class="th">Per</th>
                             <th class="th">Cum</th>
                             <th class="th">Cmt</th>
                             <th class="th">Pzr</th>
                         </tr>

                         <tr>
                             <td class="td">17.00 - 18.00</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td>
                                 <asp:Button ID="btn1" runat="server" Text="Button" CssClass="button" OnClick="Button1_Click" />
                             </td>
                         </tr>
                         <tr>
                             <td class="td">18.00 - 19.00</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td>
                                 <asp:Button ID="btn2" runat="server" Text="Button" CssClass="button" OnClick="Button2_Click" />
                                 
                             </td>
                         </tr>
                         <tr>
                             <td class="td">19.00 - 20.00</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td>
                                 <asp:Button ID="btn3" runat="server" Text="Button" CssClass="button" OnClick="Button3_Click" />
                             </td>
                         </tr>
                         <tr>
                             <td class="td">20.00 - 21.00</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td>
                                 <asp:Button ID="btn4" runat="server" Text="Button" CssClass="button" OnClick="Button4_Click" />
                             </td>
                         </tr>
                         <tr>
                             <td class="td">21.00 - 22.00</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td>
                                 <asp:Button ID="btn5" runat="server" Text="Button" CssClass="button" OnClick="Button5_Click" />
                             </td>
                         </tr>
                         <tr>
                             <td class="td">22.00 - 23.00</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td>
                                 <asp:Button ID="btn6" runat="server" Text="Button" CssClass="button" OnClick="Button6_Click" />
                             </td>
                         </tr>
                         <tr>
                             <td class="td">23.00 - 00.00</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td>
                                 <asp:Button ID="btn7" runat="server" Text="Button" CssClass="button" OnClick="Button7_Click" />
                             </td>
                         </tr>
                         <tr>
                             <td class="td">00.00 - 01.00</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td class="td">Boş</td>
                             <td>
                                 <asp:Button ID="btn8" runat="server" Text="Button" CssClass="button" OnClick="Button8_Click" />
                             </td>
                         </tr>
                     </table>
                 </div>
             </div>
             <div class="halısahaözellik">
                 <h3 style="text-align: center; font-family: 'Trebuchet MS', Arial, 'Comic Sans MS'; border-bottom: 2px solid #d4c3c3;">Fotoğraflar</h3>
                 <div class="fotograf">

                 </div>
                 <h3 style="text-align: center; font-family: 'Trebuchet MS', Arial, 'Comic Sans MS'; border-bottom: 2px solid #d4c3c3;">Özellikler</h3>
                 
                 <div class="özellikler">
                     <div class="sol">
                         <form>
                             <input type="checkbox" id="fruit1" name="fruit-1" value="Apple" checked disabled />
                             <label for="fruit1">Servis</label>
                             <input type="checkbox" id="fruit2" name="fruit-2" value="Banana" checked disabled />
                             <label for="fruit2">Duş</label>
                             <input type="checkbox" id="fruit3" name="fruit-3" value="Cherry" checked disabled />
                             <label for="fruit3">Kredi KArtı ile Ödeme</label>
                         </form>
                     </div>
                     <div class="sağ">
                         <form">
                             <input type="checkbox" id="fruit5" name="fruit-5" value="Apple" checked disabled />
                             <label for="fruit5">Otopark</label>
                             <input type="checkbox" id="fruit6" name="fruit-6" value="Banana" disabled />
                             <label for="fruit6">Ayakkabı Kiralama</label>
                             <input type="checkbox" id="fruit7" name="fruit-7" value="Cherry" checked disabled />
                             <label for="fruit7">Kafetarya</label>
                     </form>
                     </div>
                 </div>
                 <div class="iletisim">
                     <h3 style="text-align: center; font-family'Trebuchet MS', Arial, 'Comic Sans MS'; border-bottom: 2px solid #d4c3c3">İletişim</h3>
                     <h5 style="margin:15px;"><i class="fas fa-map-marker-alt"></i> Bahçelievler Mahallesi 3055 sokak Merkez/ISPARTA</h5>
                     <h5 style="margin:15px;"><i class="fas fa-phone"></i> 0507 736 4091</h5>

                 </div>
             </div>
         </div>      
    </div>
    </form>
</body>
</html>
