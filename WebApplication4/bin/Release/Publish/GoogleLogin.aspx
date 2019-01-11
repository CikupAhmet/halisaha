<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoogleLogin.aspx.cs" Inherits="WebApplication4.GoogleLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="sweetalert.js"></script>
    <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        *{
            text-align:center;
        }
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
    <script>
        function alreadyExistsEmail() {
            Swal({
                type: 'error',
                title: 'Oops...',
                text: 'Already exists email'
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="labelMail" runat="server" Text="Giriş yapmak için basınız.."></asp:Label>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" style="background-color: #4CAF50; color: white;" />
            <asp:Panel ID="panelProfil" runat="server" Visible="false">
                <hr />
                <table>
                    <tr>
                        <td rowspan="6">
                            <asp:Image ID="profilImage" runat="server" Width="50" Height="50"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ID:
                        <asp:Label ID="labelID" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name:
                        <asp:Label ID="labelName" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email:
                        <asp:Label ID="labelEmail" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender:
                        <asp:Label ID="labelGender" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Type
                            ID:
                        <asp:Label ID="type" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Kullanıcı ID: "></asp:Label><br />
                            <asp:TextBox ID="textKullaniciID" runat="server"></asp:TextBox><br />
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Kullanıcı Telefon: "></asp:Label><br />
                            <asp:TextBox ID="textKullaniciTel" runat="server"></asp:TextBox><br />
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Kullanıcı Doğum Tarihi: "></asp:Label><br />
                            <asp:TextBox ID="textKullaniciDogum" runat="server"></asp:TextBox><br />
                        </td>
                        <td>
                            <asp:Label ID="label4" runat="server" Text="Mevki: "></asp:Label><br /><br />
                            <asp:RadioButton ID="rbtnKaleci" Text="Kaleci" runat="server" /><br />
                            <asp:RadioButton ID="rbtnDefans" Text="Defans" runat="server" /><br />
                            <asp:RadioButton ID="rbtnOrtaSaha" Text="OrtaSaha" runat="server" /><br />
                            <asp:RadioButton ID="rbtnForvet" Text="Forvet" runat="server" /><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="butonSave" runat="server" Text="Üye Ol" OnClick="butonSave_Click" style="background-color: #4CAF50; color: white; width: 100px; margin-left:25px;" />
                            <asp:Button ID="btnEntry" runat="server" OnClick="btnEntry_Click" style="background-color: #4CAF40; color: white;margin-left: 20px; margin-left:25px; " Text="Giriş Yap" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="align-content:center">
                <img id="qrCode" runat="server" />
            </div>

            <asp:Panel ID="qrOnay" runat="server" Visible="false">
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
