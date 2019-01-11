<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication4._default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giriş</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <meta name="google-signin-client_id" content="61887612183-e7q4pgf205etss30qa63k366gdvrefbu.apps.googleusercontent.com"/>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="google.js"></script>
    <link href="/style.css" rel="stylesheet" />
    <link href="/anaSayfa.aspx" rel="" />
    <link href="/CS.aspx" rel="" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <meta name="viewport" content="width-device-width, initial-scale-1.0" />
    <script src="sweetalert.js"></script>
    <link rel="stylesheet" href="sweetalert2.css" />
    <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style media="screen">
        #fb-btn {
            margin-top: 20px;
        }

        #profile, #logout, #feed {
            display: none
        }
    </style>
    <script>
        function hataMesaj() {
            Swal({
             type: 'error',
             title: 'Oops...',
             text: 'Yanlış Kullanıcı Adı veya Şifre'
            })
        }
        function hataMesaj2() {
            Swal({
             type: 'error',
             title: 'Oops...',
             text: 'Kullanıcı Adı veya Şifre Girmediniz'
            })
        }

        var onClickedLoginButton = false;

        window.fbAsyncInit = function () {
            FB.init({
                appId: '772261573108416',
                cookie: true,
                xfbml: true,
                version: 'v2.8'
            });
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        };
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        function statusChangeCallback(response) {
            if (response.status === 'connected') {
                
                console.log('Logged in and authenticated');
                //setElements(true);
                if (onClickedLoginButton) {
                    testAPI();
                    onClickedLoginButton = false;
                }
            } else {
                console.log('Not authenticated');
                setElements(false);
            }
        }


        function checkLoginState() {

            onClickedLoginButton = true;
            
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        }
        function testAPI() {
            FB.api('/me?fields=name,email,birthday', function (response) {
                if (response && !response.error) {
                    
                    //console.log(response);
                    buildProfile(response);
                }
                FB.api('/me/feed', function (response) {
                    if (response && !response.error) {
                        buildFeed(response);
                    }
                });
            })
        }
        function buildProfile(user) {
            
            /*let profile = `
               
              <h3>${user.name}</h3>
              <ul class="list-group">
                <li class="list-group-item">User ID: ${user.id}</li>
                <li class="list-group-item">Email: ${user.email}</li>
                <li class="list-group-item">Birthday: ${user.birthday}</li>
                <li class="list-group-item">User ID: ${user.location.name}</li>
              </ul>
            `;
            document.getElementById('profile').innerHTML = profile;*/

            var url = 'FacebookLogin.aspx?';
            url += `uid=${user.id}&`;
            url += `uname=${user.name}&`;
            url += `uemail=${user.email}`;

            document.location.href = url;
        }

        function gotoSingupPage() {
            document.location.href = "/default.aspx";
        }

        function buildFeed(feed) {
            let output = '<h3>Latest Posts</h3>';
            for (let i in feed.data) {
                if (feed.data[i].message) {
                    output += `
                  <div class="well">
                    ${feed.data[i].message} <span>${feed.data[i].created_time}</span>
                  </div>
                `;
                }
            }
            document.getElementById('feed').innerHTML = output;
        }
        function setElements(isLoggedIn) {
            if (isLoggedIn) {
                
                //document.getElementById('logout').style.display = 'block';
                document.getElementById('profile').style.display = 'block';
                document.getElementById('feed').style.display = 'block';
                document.getElementById('fb-btn').style.display = 'none';
                document.getElementById('heading').style.display = 'none';
            } else {
                //document.getElementById('logout').style.display = 'none';
                document.getElementById('profile').style.display = 'none';
                document.getElementById('feed').style.display = 'none';
                document.getElementById('fb-btn').style.display = 'block';
                document.getElementById('heading').style.display = 'block';
            }
        }
        function logout() {
            FB.logout(function (response) {
                setElements(false);
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="wrapper" >
            
            <div class="banner">
                
                <div class="box">
                    <a href="anaSayfa.aspx"><input type="button" name="" value="Şifremi Unuttum"  style="float: right; padding: 10px; width: auto; margin-top:-10px;" /></a>
                    <h2>Giriş</h2>
                    
                    <div class="input-box">
                        <asp:TextBox ID="kullaniciIDText" runat="server"></asp:TextBox>
                        <label>Kullanıcı Adı</label>
                    </div>
                    <div class="input-box">
                        <asp:TextBox TextMode="Password" ID="kullaniciSifreText" runat="server"></asp:TextBox>
                        <label>Parola</label>
                    </div>
                    
                    <asp:Button ID="Button2" runat="server" CssClass="butonDene" Text="Giriş Yap" BackColor="#4CAF50" OnClick="Button2_Click"/>
                    
                    <%--<a href="http://facebook.com"><input type="submit" name="" value="Facebook ile Giriş Yap" style="background-color:#03A9F4"/></a>--%>
                    <fb:login-button id="fb-btn" 
                                     scope="public_profile,email,user_birthday,user_location,user_posts"
                                     onlogin="checkLoginState();" style="width: 500px;">
                    </fb:login-button>
                    <asp:Button runat="server" ID="googleGiris" CssClass="googlebtn" BackColor="red" Text="Google İle Giriş Yap" OnClick="giris"/>
                    <a href="uyeOlma.aspx"><input type="button" name=""  value="Üye Ol" style="transition: .5s; background-color: none;"/></a>
                    <asp:Label ID="email" runat="server" Text="Label" Visible="true"></asp:Label>
                    
                    <asp:Panel runat="server" ID="profilPanel" Visible="false">
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
              
                
            </div>

            <div class="hakkımızda">
                <div class="üstbaslik">
                    Halısaham ne için burada?
                </div>
                <div class="altaciklama">
                    Halısaham, halısaha maçına katılmayı seven herkes için kolaylık saglar!
                    Türkiye'de bulunan tüm halı sahalardan tek tıkla istedigin bir saate randevu almana,
                    Halısahada oyuncu eksigini tamamlamana,
                    Halısaha maçına katılmak isteyenler için maç bulmalarına,
                    Kısacası Halısaham, sana tek tıkla çok sevdigin futbol zevkini tattırmak için burada!
                </div>
                <div class="icons">
                    <a href="https://www.facebook.com" class="fa fa-facebook"></a>
                    <a href="https://twitter.com" class="fa fa-twitter"></a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>