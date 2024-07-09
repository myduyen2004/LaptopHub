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
        input[type="text"] {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
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

    </style>
</head>
<body>
    
    <div class="container">
        <img height="150px" width="150px" src="http://localhost:8080/LaptopHubWeb/images/logo/logo.png" alt="alt"/>
        <h1>NHẬN MÃ OTP</h1>
        <form action="../forgotpass" method="post" >
            <input type="hidden" name="cmd" value="1">
            <input type="text" name="receiveEmail" placeholder="Nhập email đăng kí của bạn" required><br>
            <input type="submit" value="Gửi OTP">
        </form>
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

