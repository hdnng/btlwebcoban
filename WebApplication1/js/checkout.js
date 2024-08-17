const selectMonth = document.getElementById("cardExpiryMonth");

for (let i = 1; i <= 12; i++) {
    const option = document.createElement("option");
    option.value = i.toString().padStart(2, '0'); // Adding leading zero for single-digit months
    option.text = i.toString();
    selectMonth.add(option);
}

const currentYear = new Date().getFullYear();
const selectYear = document.getElementById("cardExpiryYear");

for (let i = 0; i < 10; i++) {
    const option = document.createElement("option");
    option.value = currentYear + i;
    option.text = currentYear + i;
    selectYear.add(option);
}


// Ensure the DOM is fully loaded before executing the script
document.addEventListener("DOMContentLoaded", function () {
    // Initial call to togglePaymentFields when the DOM is loaded
    togglePaymentFields();

    // Add event listener to paymentMethod radio buttons
    var paymentMethodRadios = document.getElementsByName("paymentMethod");
    for (var i = 0; i < paymentMethodRadios.length; i++) {
        paymentMethodRadios[i].addEventListener("change", togglePaymentFields);
    }
});

function togglePaymentFields() {
    var creditCardFields = document.getElementById("creditCardFields");
    var paypalFields = document.getElementById("paypalFields");

    // Loop through paymentMethod radios to find the selected one
    var paymentMethod;
    var paymentMethodRadios = document.getElementsByName("paymentMethod");
    for (var i = 0; i < paymentMethodRadios.length; i++) {
        if (paymentMethodRadios[i].checked) {
            paymentMethod = paymentMethodRadios[i].value;
            break;
        }
    }

    // Toggle display based on the selected paymentMethod
    if (paymentMethod === "creditCard") {
        creditCardFields.style.display = "flex";
        paypalFields.style.display = "none";
    } else if (paymentMethod === "paypal") {
        creditCardFields.style.display = "none";
        paypalFields.style.display = "block";
    }
}

function formatCardNumber() {
    var cardNumberInput = document.getElementById("cardNumber");
    var inputValue = cardNumberInput.value.replace(/\s/g, ''); // Remove existing spaces

    // Insert a space every 4 characters
    var formattedValue = inputValue.replace(/(.{4})/g, '$1 ');

    // Update the input value
    cardNumberInput.value = formattedValue.trim();
}