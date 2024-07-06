<%-- 
    Document   : aboutUs
    Created on : Jul 5, 2024, 7:40:52 AM
    Author     : admin
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <%@include file="/includes/header.jsp" %>

    <head>
        <meta charset="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LAPTOPHUB</title>
        <style>
            
        </style>
    </head>

    <body>
        
        <br><br>
        <h1>
            Về chúng tôi
        </h1>
        <br><br>
        <div class="container">
            
            <div class="text">
                <p>LaptopHub - Điểm Đến Hoàn Hảo Cho Mọi Nhu Cầu Về Máy Tính Xách Tay

                    Chào mừng bạn đến với LaptopHub, cửa hàng trực tuyến hàng đầu chuyên cung cấp các dòng máy tính xách tay chất 
                    lượng cao và đáng tin cậy. Tại LaptopHub, chúng tôi hiểu rằng mỗi người có những nhu cầu và sở thích riêng biệt, 
                    vì vậy chúng tôi cam kết mang đến cho bạn những sản phẩm đa dạng từ các thương hiệu nổi tiếng như Apple, Dell, HP, Lenovo, Asus, và nhiều hãng khác.</p>
            </div>
        </div>
        <br>

        <br>
        <h1>
            Địa chỉ của chúng tôi
        </h1>
        <br>
        <div class="container">
            <div class="map">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8557120842684!2d108.25806331522307!3d15.968909688942944!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314218e6e0975b07%3A0xcaff29dfb73f0ac!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgxJDDoCBO4bq1bmc!5e0!3m2!1svi!2s!4v1600403861260!5m2!1svi!2s"
                    width="500" height="350" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false"
                    tabindex="0"></iframe>

            </div>
            <div class="address" style="margin-left: 20px ;">
                <h2>Trường đại học FPT</h2>
                <h3>Laptop Hub, thành phố Đà Nẵng, Việt Nam</h3>
                <h3>Số điện thoại: 091233</h3>
                <h3>Email: laptophub@gmail.com</h3>
                <h3>Mở cửa: Từ thứ 2 đến thứ 7 trừ các ngày lễ</h3>
                <h3>Thời gian: từ 7:00 am đến 10:00 pm</h3>
            </div>
        </div>
        <%@include file="/includes/footer.jsp" %>
    </body>

</html>

<style>

    h1 {
        text-align: center;
        font-size: 3em;
        margin: 0;
        font-size: 40px;
    }

    p {
        font-size: 25px;
        margin-left: 50px;
        font-size: 20px;
        line-height: 50px;
        margin-right: 30px
    }

    p2 {
        font-size: 25px;
        margin-right: 1000px;
        margin-top: 1000px;

    }

    .container {
        display: flex;
    }

    .image {
        flex: 1;
    }

    .text {
        flex: 2;
    }

    .map {
        margin: 0px 180px;
        padding-bottom: 50px
        
    }
    h2{
        line-height: 50px;
        padding-bottom: 30px;
    }
    h3{
        font-size: 20px;
        padding-bottom: 30px;
    }
    .address{
        margin-top: 10px
    }
</style>
