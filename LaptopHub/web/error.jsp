<%-- 
    Document   : error
    Created on : Jul 7, 2024, 6:24:14 PM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <style>
            .body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 80vh;
                margin: 0;
                background-color: #f5f7fa;
                font-family: Arial, sans-serif;
            }
            .container_01 {
                display: flex;
                align-items: center;
                background-color: #fff;
                border-radius: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px 40px;
            }
            .payment-info {
                text-align: center;
                padding: 20px;
            }
            .payment-info h1 {
                color: red;
                font-size: 24px;
                margin-bottom: 10px;
                padding-top: 40px;
            }
            .payment-info p {
                font-size: 16px;
                padding-top: 40px;
                padding-bottom: 30px;
            }
            .payment-info .amount {
                font-weight: bold;
            }
            .person_01 {
                margin-left: 40px;
            }
            .person_01 img {
                width: 150px;
            }
            .return {
                text-decoration: none;
                padding: 10px 10px;
                border-radius: 5px;
                font-size: 16px;
                transition: background-color 0.3s, color 0.3s;
                background-color: #460E6D; /* Green */
                color: white;
            
            }
            .add {
                text-decoration: none;
                padding: 10px 10px;
                border-radius: 5px;
                font-size: 16px;
                transition: background-color 0.3s, color 0.3s;
                background-color: grey; /* Green */
                color: white;
            
            }
            
        </style>
    </head>
    <body>
        <%@include file="/includes/header.jsp" %>
        <div class="body">
        <div class="container_01">
            <div class="payment-info">
                <img src="images/others/error.png" alt="Success Icon" width="300" height="auto">
                <h1>ĐẶT HÀNG THẤT BẠI</h1>
                <p>${msg}</p>
                <a href="./home" class="return" >Quay về trang chủ</a>
                <br><br><br>
                <a href="./payment" class="add">Nạp thêm tiền vào ví</a>
            </div>
            <div class="person_01">
                <img src="images/others/order.jpg" alt="Person Image">
            </div>
        </div>
            </div>
    </body>
</html>
