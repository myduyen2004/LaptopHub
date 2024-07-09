<%-- 
    Document   : verify-gmail
    Created on : Jul 1, 2024, 11:36:26 PM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Password</title>
        <link rel="stylesheet" href="../css/toast.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <style>

            body {
                font-family:"Times New Roman", Times, serif;
                background-color: #460E6D;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .container {
                background-color: #fff;
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                width: 400px;
                text-align: center;
            }
            h1 {
                margin-bottom: 20px;
                font-size: 24px;
                color: #333;
            }
            input[type="password"] {
                width: 90%;
                padding: 15px;
                margin: 10px 0px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
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
            .container input:focus {
                background: #CCCCCC;
                outline: none;
            }
            .but{
                text-decoration: none;
                border-radius: 5px;
                font-size: 16px;
                transition: background-color 0.3s, color 0.3s;
                background-color: #A3A3A3; /* Green */
                color: white;
                border-width: 20px;
                padding: 15px 115px
            }

        </style>
    </head>
    <body>

        <div class="container">
            <img height="100px" width="100px" src="http://localhost:8080/LaptopHubWeb/images/logo/logo.png" alt="alt"/>
            <h1>NHẬP MẬT KHẨU MỚI</h1>
            <form action="./forgotpass" method="post" >
                <input type="hidden" name="cmd" value="3">
                <input type="hidden" name="email" value="${email}">
                <input type="password" name="password" placeholder="Nhập mật khẩu mới" required><br><br>
                <input type="password" name="password-again" placeholder="Nhập lại mật khẩu mới" required><br><br>
                <input type="submit" value="GỬI OTP">
            </form>
            <br>
            <a class="but" href="HomeServlet">QUAY VỀ TRANG CHỦ</a>
        </div>
        <script>
        // Kiểm tra xem có thông báo thành công hay không
            <% if (request.getAttribute("success") != null) { %>
                toastr.success('<%= request.getAttribute("success") %>');
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
                toastr.error('<%= request.getAttribute("error") %>');
            <% } %>
        </script>
    </body>
</html>
