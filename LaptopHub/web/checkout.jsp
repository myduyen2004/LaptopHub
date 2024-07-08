<%-- 
    Document   : checkout
    Created on : Jul 5, 2024, 11:47:43 PM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" charset="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="thanhtoan.css">
    </head>
    <body>
        <%@include file="/includes/header.jsp" %>
        <div class="Checkout_section py-5" id="accordion">
            <div class="container">
                <div class="checkout_form">
                    <form action="Checkout" method="POST">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 mb-4">
                                <h3 class="bg-dark text-white text-center py-2">Chi tiết đơn hàng</h3>
                                <div class="form-group">
                                    <label>Tên khách hàng</label>
                                    <input class="form-control" value="${sessionScope.name}" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Email </label>
                                    <input class="form-control" value="${sessionScope.email}" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <input name="address" class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Phường, Xã</label>
                                    <input name="ward"  class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Quận</label>
                                    <input name="district" class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Tỉnh</label>
                                    <input name="province" class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Số điện thoại</label>
                                    <input name="phone" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <h3 class="bg-dark text-white text-center py-2">Sản phẩm</h3>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Sản phẩm</th>
                                            <th>Nhãn hàng</th>
                                            <th>Số lượng</th>
                                            <th>Tổng</th>
                                        </tr>
                                    </thead>
                                    <c:set var="o" value="${sessionScope.cart}"/>
                                    <c:set var="ooo" value="${sessionScope.total}"/>
                                    <c:forEach items="${o.items}" var="i" varStatus="status">
                                        <tr >
                                            <td>${status.index + 1}</td>
                                            <td>${i.product.getProductName()}</td>
                                            <td><strong>${i.getQuantity()}</strong></td>
                                            <td>${i.product.getSupplierString()}</td>
                                            <td id="totalPrice${status.index}">${i.getTotalMoney()} </td>
                                        </tr>

                                    </c:forEach>

                                    <tfoot>
                                        <tr class="order_total">
                                            <th>Tổng đơn</th>
                                            <td colspan="3"><strong>${ooo}</strong></td>
                                        </tr>
                                    </tfoot>
                                </table>
                                <div class="payment_method">
                                    <div class="form-check">
                                        <input value="online" name="payment_method" type="radio" class="form-check-input">
                                        <p for="payment_momo" class="form-check-label">Ví hệ thống LaptopHub</p>

                                    </div>
                                    <div class="form-check">
                                        <input value="cod" name="payment_method" type="radio" class="form-check-input">
                                        <label for="payment_cod" class="form-check-label">Thanh toán khi nhận hàng </label>
                                    </div>
                                    <div class="order_button text-center mt-4">
                                        <button type="submit" class="btn btn-warning btn-lg">Đặt hàng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

