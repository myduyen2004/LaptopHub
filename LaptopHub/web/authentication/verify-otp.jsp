<%-- 
    Document   : verify-otp
    Created on : Jul 2, 2024, 9:59:06 AM
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>OTP Verification Form</title>
        <link rel="stylesheet" href="style.css" />
        <!-- Boxicons CSS -->
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Times New Roman", Times, serif;
            }
            body {
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background: #460E6D;
            }
            :where(.container, form, .input-field, header) {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }
            .container {
                background: #fff;
                padding: 30px 65px;
                border-radius: 12px;
                row-gap: 20px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            }
            .container header {
                height: 65px;
                width: 65px;
                background: #4070f4;
                color: #fff;
                font-size: 2.5rem;
                border-radius: 50%;
            }
            .container h4 {
                font-size: 1.25rem;
                color: #333;
                font-weight: 500;
            }
            form .input-field {
                flex-direction: row;
                column-gap: 10px;
            }
            .input-field input {
                height: 45px;
                width: 42px;
                border-radius: 6px;
                outline: none;
                font-size: 1.125rem;
                text-align: center;
                border: 1px solid #ddd;
            }
            .input-field input:focus {
                box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
            }
            .input-field input::-webkit-inner-spin-button,
            .input-field input::-webkit-outer-spin-button {
                display: none;
            }
            form button {
                margin-top: 25px;
                width: 100%;
                color: #fff;
                font-size: 1rem;
                border: none;
                padding: 9px 0;
                cursor: pointer;
                border-radius: 6px;
                pointer-events: none;
                background: linear-gradient(to right, #000, #460E6D);
                transition: all 0.2s ease;
            }
            form button.active {
                background: #460E6D;
                pointer-events: auto;
            }
            form button:hover {
                background: #460E6D;
            }
            input[type="submit"] {
                width: 100%;
                padding: 15px;
                margin: 20px 0;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                background: linear-gradient(to right, #000, #460E6D);
                color: white;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background: #460E6D
            }
        </style>
    </head>
    <body>
        <div class="container">
            <header>
                <i class="bx bxs-check-shield"></i>
            </header>
            <h4>XÁC THỰC MÃ OTP</h4>
            <form action="ForgotPassword" method="POST">
                Mã xác thực đã được gửi đến email của bạn ${email}
                <input type="hidden" name="email" value="${email}">
                <br><br>
                <input type="hidden" name="cmd" value="2">
                <div class="input-field" >
                    <input type="number" name="otp1"/>
                    <input type="number" name="otp2" disabled />
                    <input type="number" name="otp3" disabled />
                    <input type="number" name="otp4" disabled />
                    <input type="number" name="otp5" disabled />
                    <input type="number" name="otp6" disabled />
                </div>
                <button>Verify OTP</button>
            </form>
        </div>
    </body>
    <script>
            const inputs = document.querySelectorAll("input"),
                    button = document.querySelector("button");
            // iterate over all inputs
            inputs.forEach((input, index1) => {
                input.addEventListener("keyup", (e) => {
                    // This code gets the current input element and stores it in the currentInput variable
                    // This code gets the next sibling element of the current input element and stores it in the nextInput variable
                    // This code gets the previous sibling element of the current input element and stores it in the prevInput variable
                    const currentInput = input,
                            nextInput = input.nextElementSibling,
                            prevInput = input.previousElementSibling;
                    // if the value has more than one character then clear it
                    if (currentInput.value.length > 1) {
                        currentInput.value = "";
                        return;
                    }
                    // if the next input is disabled and the current value is not empty
                    //  enable the next input and focus on it
                    if (nextInput && nextInput.hasAttribute("disabled") && currentInput.value !== "") {
                        nextInput.removeAttribute("disabled");
                        nextInput.focus();
                    }
                    // if the backspace key is pressed
                    if (e.key === "Backspace") {
                        // iterate over all inputs again
                        inputs.forEach((input, index2) => {
                            // if the index1 of the current input is less than or equal to the index2 of the input in the outer loop
                            // and the previous element exists, set the disabled attribute on the input and focus on the previous element
                            if (index1 <= index2 && prevInput) {
                                input.setAttribute("disabled", true);
                                input.value = "";
                                prevInput.focus();
                            }
                        });
                    }
                    //if the fourth input( which index number is 3) is not empty and has not disable attribute then
                    //add active class if not then remove the active class.
                    if (!inputs[3].disabled && inputs[3].value !== "") {
                        button.classList.add("active");
                        return;
                    }
                    button.classList.remove("active");
                });
            });
            //focus the first input which index is 0 on window load
            window.addEventListener("load", () => inputs[0].focus());
        </script>
        <script>
        // Kiểm tra xem có thông báo thành công hay không
            <% if (request.getAttribute("success") != null) { %>
                toastr.success('<%= request.getAttribute("success") %>');
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
                toastr.error('<%= request.getAttribute("error") %>');
            <% } %>
        </script>
</html>