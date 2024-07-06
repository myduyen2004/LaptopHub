<%-- 
    Document   : checkout
    Created on : Jul 5, 2024, 11:47:43 PM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="text/html; charset=UTF-8">
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
                    <form action="checkout" method="POST">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 mb-4">
                                <h3 class="bg-dark text-white text-center py-2">Chi tiết đơn hàng</h3>
                                <div class="form-group">
                                    <label>Tên khách hàng</label>
                                    <input readonly class="form-control" value="Admin" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Email </label>
                                    <input readonly class="form-control" value="khuonghung1423@gmail.com" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <input required name="address" class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Số điện thoại</label>
                                    <input required name="phone" class="form-control" type="number">
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7">
                                <h3 class="bg-dark text-white text-center py-2">Sản phẩm</h3>
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th>Nhãn hàng</th>
                                                <th>Số lượng</th>
                                                <th>Tổng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Champion Graphic Big Logo T-Shirt <strong>× 1</strong></td>
                                                <td>S</td>
                                                <td>White</td>
                                                <td>149000.0</td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr class="order_total">
                                                <th>Tổng đơn</th>
                                                <td colspan="3"><strong>179000.0</strong></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="payment_method">
                                    <div class="form-check">
                                        <input id="payment_momo" value="momo" name="payment_method" type="radio" class="form-check-input">
                                        <p for="payment_momo" class="form-check-label">Ví hệ thống LaptopHub</p>
                                        <img style="width: 25px; height: auto" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeSbQ8151prKyMiS2hCNd6eISXmP0v0gIsdg&s" alt="alt"/>

                                    </div>
                                    <div class="form-check">
                                        <input id="payment_momo" value="momo" name="payment_method" type="radio" class="form-check-input">
                                        <label for="payment_momo" class="form-check-label">Momo <img src="assets/img/icon/papyel.png" alt=""></label>
                                        <img style="width: 30px; height: auto" src="https://developers.momo.vn/v3/vi/assets/images/square-8c08a00f550e40a2efafea4a005b1232.png" alt="alt"/>

                                    </div>
                                    <div class="form-check">
                                        <input id="payment_vnpay" value="vnpay" name="payment_method" type="radio" class="form-check-input">
                                        <label for="payment_vnpay" class="form-check-label">VN Pay <img src="assets/img/icon/papyel.png" alt=""></label>
                                        <img style="width: 25px; height: auto" src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Icon-VNPAY-QR.png" alt="alt"/>

                                    </div>
                                    <div class="form-check">
                                        <input id="payment_cod" value="cod" name="payment_method" type="radio" class="form-check-input">
                                        <label for="payment_cod" class="form-check-label">Thanh toán khi nhận hàng </label>
                                        <img style="width: 25px; height: auto" src="https://t4.ftcdn.net/jpg/04/53/70/41/360_F_453704176_fRLaZTHGmRZmM6BpZZe2PT17DBsjb4md.jpg" alt="alt"/>

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

