<%-- 
    Document   : add-product-form
    Created on : Jun 25, 2024, 9:11:48 PM
    Author     : myduyen
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận đơn hàng</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="icon" href="assets/img/kaiadmin/favicon.ico" type="image/x-icon"/> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <style>
            body {
                background-color: #f5f5f5;
            }
            .card-header {
                font-weight: bold;
                background-color: #fff;
                border-bottom: none;
            }

            .card-body {
                background-color: #fff;
            }

            .btn-outline-secondary {
                margin-right: 5px;
                margin-bottom: 5px;
            }
            .btn-block {
                margin-top: 10px;
            }
            .container01{
                background-color: #ffffff;
                width: 100%;
                min-width: 450px;
                position: relative;
                margin:  10px auto;
                padding: 0px 20px;
                border-radius: 7px;
                box-shadow: 0 20px 35px rgba(0,0,0,0.05);
            }

            .label{
                display: block;
                position: relative;
                background-color: #025bee;
                color: #ffffff;
                font-size: 18px;
                text-align: center;
                width: 300px;
                padding: 18px 0;
                margin: auto;
                border-radius: 5px;
                cursor: pointer;
            }
            table{
                width: 100%;
                border-collapse: collapse;
            }

            th, td,td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <form action="./manageord" method="GET" enctype="multipart/form-data">
            <input type="hidden" name="command" value="CONFIRM">
            <input type="hidden" name="orderId"
                   value="${THE_ORDER.getOrderId()}">
            <div class="container mt-5" >
                <h2 class="mb-4" style="padding-left: 50px; padding-top: 50px">Xác nhận thông tin giao hàng</h2>
                <div class="row">
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="form-group">
                                <h5 style="font-weight: bold; padding-top: 10px; margin-left: 50px;">Tên khách hàng: 
                                ${THE_ORDER.getUserName().getFullName()}</h5>
                                <h5 style="font-weight: bold; padding-top: 10px; margin-left: 50px;">Địa chỉ: ${THE_ORDER.getAddress()}- ${THE_ORDER.getWard()}- ${THE_ORDER.getDistrict()}- ${THE_ORDER.getProvince()}</h5>
                                <h5 style="font-weight: bold; padding-top: 10px; margin-left: 50px;">SĐT: ${THE_ORDER.getPhone()}</h5>

                            </div>
                            
                            <div class="card-header">
                                DANH SÁCH SẢN PHẨM
                            </div>
                            <table border="1px" width="1200px">

                                <tr>
                                    <th>STT</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Mã sản phẩm</th>
                                    <th>Giá Sản Phẩm</th>
                                    <th>Số lượng</th>
                                </tr>
                                <c:forEach items="${THE_LIST}" var="p" varStatus="status">

                                    <tr style="height: 100px;">
                                        <td>${status.index + 1}</td>
                                        <td>${p.getName()}</td>
                                        <td>${p.getProductId()}</td>
                                        <td>
                                            <h5 class="sale-price" style="font-weight: bold;">${p.getPricePerUnit()}</h5>
                                        </td>
                                        <td>
                                            ${p.getQuantity()}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <div class="total-cart">
                                <br><br>
                                
                                <table>
                                    <tr>
                                        <td><h3>Thành Tiền</h3></td>
                                        <td><h3 id="grandTotal">${THE_ORDER.getTotalMoneyString()}</h3></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="form-group">
                                <label>Cân nặng</label>
                                <input type="number" class="form-control" name="weight" value="">
                            </div>
                            <input type="submit" class="btn btn-primary btn-block" value="Xác nhận đơn hàng">
                            <a href="./ManageOrder" type="button" class="btn btn-secondary btn-block">Quay trở lại trang quản trị</a>
                        </div>
                    </div>
                    </div>
                </div>
        </form>      
                <br><br>                    
                
                <script>
                    // Kiểm tra xem có thông báo thành công hay không
                    <% if (request.getAttribute("success") != null) { %>
                    toastr.success('<%= request.getAttribute("success") %>');
                    <% } %>
                    <% if (request.getAttribute("error") != null) { %>
                    toastr.error('<%= request.getAttribute("error") %>');
                    <% } %>
                </script>
                <%@include file="../includes/footer.jsp" %>
                </body>

                </html>
