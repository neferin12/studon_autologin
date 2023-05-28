let login_button = document.getElementsByClassName("glyphicon-login")[0]
if(login_button){
    console.debug("Login button found, clicking it...")
    login_button.click()
}
login_button = document.querySelector("a[href='saml.php']")
if(login_button){
    console.debug("Login button found, clicking it...")
    login_button.click()
}