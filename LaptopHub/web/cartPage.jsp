<%-- 
    Document   : cartPage
    Created on : Jul 4, 2024, 12:42:52 AM
    Author     : ADM
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0px;
                padding: 0;
            }

            h1 {
                text-align: center;
                margin-top: 20px;
                color: #460E6D
            }

            .cart-item, .total-cart {
                width: 80%;
                margin: 0 auto;
                border: 1px solid #ddd;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .cart-item table, .total-cart table {
                width: 100%;
                border-collapse: collapse;
            }

            .cart-item th, .cart-item td, .total-cart td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
            }

            .cart-item th {
                background-color: #f2f2f2;
            }

            .quantity a {
                text-decoration: none;
                color: #460E6D; /* Màu cam cho các liên kết */
            }

            .quantity a:hover {
                text-decoration: underline;
            }

            button {
                background-color: #460E6D; /* Màu cam cho nút */
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
            }

            button:hover {
                background-color: #460E6D; /* Màu cam đậm hơn khi hover */
            }

            input[type="submit"] {
                background-color: #460E6D; /* Màu cam cho nút */
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
            }

            input[type="submit"]:hover {
                background-color: black; /* Màu cam đậm hơn khi hover */
            }

            .total-cart {
                margin-top: 20px;
                text-align: right;
            }

            .total-cart h3 {
                display: inline-block;
                margin-right: 20px;
            }

            .flag img {
                border-radius: 5px;
            }
            

        </style>
    </head>

    <%@include file="/includes/header.jsp" %>
    <br><br>
    <body>
        <h1>Đơn Hàng Của Bạn</h1>
        <div class="cart-item">
            <table class="table">
                <tbody>
                    <c:forEach var= "supplier" items= "${supplierList}" >
                        <tr>
                            <td>
                                <div class="flag">
                                    <img style="height: 30px; width: 40px"
                                         src="${supplier.getImgLogo()}"
                                         />
                                </div>
                            </td>
                            <td>${supplier.getCompanyName()}</td>
                            <td class="text-end">${supplier.getCountry()}</td>
                            <td class="text-end"><a href="${supplier.getHomePage()}">Website ${supplier.getCompanyName()}</a></td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
            <table border="1px" width="1200px">
                
                <tr>
                    <th>STT</th>
                    <th>Hình ảnh</th>
                    <th>Tên Sản Phẩm</th>
                    <th>Giá Sản Phẩm</th>
                    <th>Số lượng</th>
                    <th>Đơn Giá</th>
                    <th></th>
                </tr>
            
                <c:set var="o" value="${sessionScope.cart}"/>
                
                    <c:forEach items="${o.items}" var="i" varStatus="status">
                        <c:set var="tt" value="${tt+1}"/>
                        <tr style="height: 170px;">
                            <td>${status.index + 1}</td>
                            <td><img style="height: 60px; width: 60px; margin-left: 20px" src="${i.product.getImageList().get(1).getImageUrl()}" alt="alt"/></td>
                            <td>${i.product.getProductName()}</td>
                            <td>
                                <h5 class="sale-price">${i.getPricePerUnitAfterDiscount()}</h5>
                            </td>
                            <td>
                                <input name="quantity" min="1" max="100" value="${i.quantity}" type="number" >
                            </td>
                            <td id="totalPrice${status.index}">${i.getTotalMoney()}</td>
                            <td style="text-align: center">
                                <input type="hidden" name="id" value="${i.product.getProductId()}"/>
                                <a href="CartServlet?action=deletecart&product_id=${i.product.getProductId()}"><i class="fa fa-trash-o"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="total-cart">
                    <table>
                        <tr>
                            <td><h3>Thành Tiền</h3></td>
                            <td><h3 id="grandTotal">${o.getTotalMoney()}</h3></td>
                            <td><input type="submit" value="Thanh Toán" href="#" class="button"/></td>
                        </tr>
                    </table>
                </div>
                            
                </body>
                <br><br>
                <br><br>
                <%@include file="/includes/footer.jsp" %>
                </html>
