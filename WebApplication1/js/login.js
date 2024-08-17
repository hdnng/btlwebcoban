const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const forgotPasswordLink = document.getElementById('forgot-password-link');
const backToLoginLink = document.getElementById('back-to-login');
const container = document.querySelector('.auth-forms');
const repeatPasswordField = document.getElementById('repeatpass');
const passwordField = document.getElementById('signuppassword');

signUpButton.addEventListener('click', () => {
    container.classList.add('right-panel-active');
});

signInButton.addEventListener('click', () => {
    container.classList.remove('right-panel-active');
});

forgotPasswordLink.addEventListener('click', () => {
    container.classList.add('forgot-password-active');
});

backToLoginLink.addEventListener('click', () => {
    container.classList.remove('forgot-password-active');
});

signUpButton.addEventListener('click', () => {
    if 
}

function togglePassword(inputId) {
        var passwordInput = document.getElementById(inputId);
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    }

document.addEventListener("DOMContentLoaded", () => {
        // Select all forms
        const forms = document.querySelectorAll('form');

        // Function to check if passwords match
        function passwordsMatch(passwordField, repeatPasswordField) {
            return passwordField.value === repeatPasswordField.value;
        }

        // Add submit event listener to each form
        forms.forEach(form => {
            form.addEventListener('submit', function (event) {
                // Prevent form submission
                event.preventDefault();

                // Select all input fields in the form
                const inputs = form.querySelectorAll('input');
                let allFilled = true;
                let firstEmptyField = null;

                // Variables to hold password fields
                let passwordField = null;
                let repeatPasswordField = null;

                // Check if all fields are filled and passwords match if applicable
                inputs.forEach(input => {
                    if (input.type === 'password') {
                        if (input.name === 'password') {
                            passwordField = input;
                        } else if (input.name === 'repeat-password') {
                            repeatPasswordField = input;
                        }
                    }
                    if (input.value.trim() === '') {
                        allFilled = false;
                        input.style.borderColor = "red"; // Highlight empty field
                        if (!firstEmptyField) {
                            firstEmptyField = input; // Keep track of the first empty field
                        }
                    } else {
                        input.style.borderColor = ""; // Reset border color
                    }
                });

                // Check if passwords match
                if (passwordField && repeatPasswordField) {
                    if (!passwordsMatch(passwordField, repeatPasswordField)) {
                        allFilled = false;
                        repeatPasswordField.style.borderColor = "red"; // Highlight repeat password field
                        if (!firstEmptyField) {
                            firstEmptyField = repeatPasswordField; // Keep track of the repeat password field
                        }
                        alert('Passwords do not match.');
                    } else {
                        repeatPasswordField.style.borderColor = ""; // Reset border color if passwords match
                    }
                }

                // If all fields are filled and passwords match, submit the form
                if (allFilled) {
                    form.submit();
                } else {
                    alert('Please fill in all the fields correctly.');
                    if (firstEmptyField) {
                        firstEmptyField.focus(); // Focus on the first empty field or password mismatch field
                    }
                }
            });
        });
    });

function check() {
    var MST = document.getElementById('MST').value;

    // Check if MST is a number
    if (!isNaN(MST)) {
        // Check if MST has 8 or more characters
        if (MST.length >= 8) {
            if (parseInt(MST.charAt(0)) > 0) {
                alert('Added SuccessFully!');
                document.getElementById('form4').submit();
            } else {
                alert('MST should start with a number greater than zero.');
                return false;
            }
        } else {
            alert('MST should have 8 or more characters.');
            return false;
        }
    } else {
        alert('MST should be a number.');
        return false;
    }
}