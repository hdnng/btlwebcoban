
function validateUsername() {
    var usernameInput = document.getElementById('txtUsername');
    var loginButton = document.getElementById('loginButton');

  
    if (usernameInput.value.length >= 6) {
        loginButton.disabled = false;
        loginButton.style.display = 'block';
    } else {
        loginButton.disabled = true;  
        loginButton.style.display = 'none'; 
        /*loginButton.style.background = 'red'*/
    }
}


document.getElementById('txtUsername').addEventListener('input', validateUsername);


window.onload = function () {
    validateUsername();
}