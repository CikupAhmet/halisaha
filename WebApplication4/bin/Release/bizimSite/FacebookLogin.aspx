<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacebookLogin.aspx.cs" Inherits="WebApplication4.FacebookLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" />
    
</head>

<body>
    <form id="form1" runat="server">
        <div >
            <asp:Label ID="labelName" runat="server" CssClass="label" Text="Label"></asp:Label><br />
            <asp:Label ID="labelMail" runat="server" CssClass="label" Text="Label"></asp:Label><br />
            <asp:Label ID="labelID" runat="server" Text="Label"></asp:Label><br />
            <asp:Label runat="server">Kullanıcı ID: </asp:Label>
            <asp:TextBox ID="textKullaniciId" runat="server" style="margin-left: 80px;"></asp:TextBox><br />
            <asp:Label runat="server">Kullanıcı Telefon: </asp:Label>
            <asp:TextBox ID="textTelefon" runat="server" style="margin-left: 43px; margin-top: 5px;"></asp:TextBox><br />
            <asp:Label runat="server">Kullanıcı Doğum Tarihi: </asp:Label>
            <asp:TextBox ID="textDogum" runat="server" style="margin-top: 5px;"></asp:TextBox><br /><br />
            <asp:Label runat="server">Mevki: </asp:Label><br /><br />
            <asp:RadioButton ID="RadioButton1" Text="Kaleci" runat="server" /><br />
            <asp:RadioButton ID="RadioButton2" Text="Defans" runat="server" /><br />
            <asp:RadioButton ID="RadioButton3" Text="Ortasaha" runat="server" /><br />
            <asp:RadioButton ID="RadioButton4" Text="Forvet" runat="server" /><br />
            <asp:Button ID="Button1" runat="server" Text="Kayıt Ol" OnClick="Button1_Click" style="background-color: #4CAF50; color: white;" />
            <asp:Button ID="Button2" runat="server"  Text="Giriş Yap" OnClick="Button2_Click" style="background-color: #4CAF50; color:white;" />

            <div style="align-content:center">
                <img id="qrCode" runat="server" />
            </div>

            <asp:Panel runat="server" ID="qrOnay" Visible="false">
                 <div id="myModal" class="row" style="z-index:1;">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Yeni Yazılım Ekle</h4>
                                            </div>
                                            <div class="modal-body">
                                               
                                                    <div class="form-group">
                                                        <label>Kod</label>
                                                        <asp:TextBox ID="txtcode" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                <asp:Button ID="btnPasswordControl" OnClick="btnPasswordControl_Click" runat="server" Text="Giriş" />
                                                                                    
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
            </asp:Panel>
           
        </div>
    </form>
</body>
</html>
