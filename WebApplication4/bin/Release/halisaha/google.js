function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    
    $(".g-signin2").css("display", "none");
    $(".data").css("display", "block");
    $("#pic").attr('src', profile.getImageUrl());
    $("#email").text(profile.getEmail());
    $("#username").text(profile.getName());
    window.location ="WebForm1.aspx"
    //document.getElementById('Label1').innerHTML = profile.getEmail();
    document.getElementById('Label1').innerHTML = profile.getName();
    console.log('Full Name: ' + profile.getName());
    console.log('Given Name: ' + profile.getGivenName());
    Session["email"] = profile.getEmail().Text.ToString();
    Session["username"] = profile.getName().Text.ToString();
    alert('test');
    //window.location.href = "CS.aspx";
}



function sayfaDegis() {
    Response.redirect("default.aspx");
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        
        alert("You have been success");
        $(".g-signin2").css("display", "block");
        $(".data").css("display", "none");
    });
    

}



