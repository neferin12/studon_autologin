function login() {
    const urlParams = new URLSearchParams(window.location.search);
    const target = urlParams.get('target');

    let samlUrl = "./saml.php";
    if(target) {
        samlUrl += "?returnTo=" + target;
    }
    window.open(samlUrl,"_self")
}

function checkForLoginButton() {
    return (
        !!(
            document.getElementsByClassName("glyphicon-login")[0] ||
            document.querySelector("a[href='./saml.php']") ||
            document.evaluate("//a[contains(., 'Anmelden')]", document, null, XPathResult.ANY_TYPE, null).iterateNext()
        )
    )
}

if(checkForLoginButton()) {
    login()
}