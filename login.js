let login_button = document.getElementsByClassName("glyphicon-login")[0]
if(login_button){
    console.debug("Login button found, clicking it...")
    login_button.click()
}
login_button = document.querySelector("a[href='./saml.php']") || document.evaluate("//a[contains(., 'Anmelden')]", document, null, XPathResult.ANY_TYPE, null ).iterateNext()
if(login_button){
    console.debug("Login button found, clicking it...")
    login_button.click()
}else{
    console.warn("Login button not found!")
}