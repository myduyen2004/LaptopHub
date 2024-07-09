<%-- 
    Document   : signup
    Created on : Jun 16, 2024, 9:00:25 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>   
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .header-text {
                text-align: center;
                margin: 20px 0;
            }
            .signup-container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .signup-form {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                margin-bottom: 20px;
            }
            .signup-form div {
                margin-bottom: 15px;
            }
            .signup-form label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }
            .signup-form input[type="text"],
            .signup-form input[type="password"],
            .signup-form input[type="email"],
            .signup-form input[type="date"],
            .signup-form input[type="tel"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .signup-form .checkbox-container {
                display: flex;
                align-items: center;
            }
            .signup-form .checkbox-container input {
                margin-right: 10px;
            }
            .signup-form button {
                background-color: #660066;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
            }
            .signup-form button:hover {
                background-color: #460e6d;
            }
            .signup-form .login-link {
                text-align: center;
                margin-top: 20px;
            }
            .signup-form .login-link a {
                color: #660066;
                text-decoration: none;
            }
            .signup-form .login-link a:hover {
                text-decoration: underline;
            }
            .error-message {
                font-weight: bold;
                color: red;
                text-align: center;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/includes/header.jsp" />
        <div class="signup-container">
            <h1 class="header-text">Đăng Kí</h1>
            <form class="signup-form" action="./signup" method="post">
                <div>
                    <label for="username">Tên đăng nhập:</label>
                    <input type="text" id="username" name="username" placeholder="Nhập tại đây" required>
                </div>
                <div>
                    <label for="fullname">Quý Danh Khách Hàng:</label>
                    <input type="text" id="fullname" name="fullname" placeholder="Nhập tại đây" required>
                </div>
                <div>
                    <label for="birthday">Ngày Tháng Năm Sinh:</label>
                    <input type="date" id="birthday" name="birthday" required>
                </div>
                <div>
                    <label for="address">Địa Chỉ:</label>
                    <input type="text" id="address" name="address" placeholder="Nhập tại đây" required>
                </div>
                <div>
                    <label for="phonenumber">Số điện thoại:</label>
                    <input type="tel" id="phonenumber" name="phonenumber" placeholder="Nhập tại đây" required>
                </div>
                <div>
                    <label for="password">Mật khẩu tài khoản:</label>
                    <input type="password" id="password" name="password" placeholder="Nhập tại đây" required>
                </div>
                <div>
                    <label for="confirm-password">Xác nhận mật khẩu:</label>
                    <input type="password" id="confirm-password" name="confirm-password" placeholder="Nhập tại đây" required>
                </div>
                <div>
                    <label for="email">Email (không bắt buộc):</label>
                    <input type="email" id="email" name="email" placeholder="Nhập tại đây">
                </div>
                <div class="checkbox-container">
                    <input type="checkbox" id="terms" name="terms" required>
                    <label for="terms">Tôi đã đọc và đồng ý với điều khoản mua hàng</label>
                </div>
                <div class="checkbox-container">
                    <input type="checkbox" id="privacy" name="privacy" required>
                    <label for="privacy">Tôi đã đọc và đồng ý với điều khoản thông tin cá nhân</label>
                </div>
                <button type="submit">Đăng kí</button>
                <div class="login-link">
                    Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a>
                </div>
                <% String error = (String) request.getAttribute("error"); %>
                <% if (error != null) { %>
                <div class="error-message"><%= error %></div>
                <% } %>
            </form>
        </div>
        <jsp:include page="/includes/footer.jsp" />
    </body>
</html>
