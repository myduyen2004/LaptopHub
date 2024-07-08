<%-- Document : gmail_code Created on : Sep 23, 2023, 12:48:57 AM Author : vnitd --%> <%@page contentType="text/html"
                                                                                              pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <style>
            * {
                margin: 0;
                padding: 0;
            }
            .body {
                background-color: #eee;
                font-family: Arial, Helvetica, sans-serif;
                padding-top: 20px;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                padding-bottom: 10px;
                background-color: white;
                border-radius: 12.5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                padding: 0 0 25px 0;
            }
            .img-header {
                padding: 0 0 0 0;
                text-align: center;
            }
            h1 {
                color: #7b1fa2;
                border-left: 4px solid #7b1fa2;
                padding-left: 30px;
                font-size: 30px;
            }
            .inside-content {
                padding: 34px;
                padding-bottom: 25px;
                text-align: justify;
            }
            .body1 {
                font-size: 20px;
                font-weight: bold;
                color: #555;
                margin-bottom: 10px;
            }
            .body2 {
                font-size: 17px;
                color: #666;
                margin-bottom: 15px;
                line-height: 1.5;
            }
            ul {
                margin-left: 30px;
                margin-bottom: 15px;
                color: #7b1fa2;
            }
            li {
                padding: 3px 0 3px 10px;
            }
            .code-block {
                background-color: #7b1fa22a;
                padding: 12px 0;
                color: #7b1fa2;
                text-align: center;
                font-weight: bold;
                font-size: 25px;
                letter-spacing: 1.5px;
                margin: 25px 0;
                border-radius: 5px;
            }
            a.link {
                text-decoration: none;
                color: #7b1fa2;
            }
            .footer {
                color: #888;
                padding: 20px;
            }
            .footer p {
                font-size: 12px;
                text-align: center;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <div class="body">
            <div class="container">
                <div class="img-header">
                    <img src="../images/others/order.jpg" width="100"/>
                </div>
                <h1>THÔNG BÁO CÓ MỘT ĐƠN ĐẶT HÀNG MỚI TỪ LAPTOPHUB</h1>
                <div class="inside-content">
                    <p class="body1">LAPTOPHUB</p>
                    <p class="body1">Có một đơn đặt hàng mới từ người dùng [USERNAME]</p>
                    <p class="body2">Chi tiết</p>
                    <ul>
                        <li><span class="body2">Email: [EMAIL]</span></li>
                        <li><span class="body2">Tên tài khoản: [USERNAME]</span></li>
                        <li><span class="body2">Tên tài khoản: [PHONE]</span></li>
                        <li><span class="body2">Vào lúc: [WHEN]</span></li>
                        <li><span class="body2">Đơn giá: [TOTAL]</span></li>
                        <li><span class="body2">Mã đơn hàng: [CODE]</span></li>
                    </ul>
                    <p class="body2">
                        Hãy xác nhận lại đơn hàng với người dùng. Để xác nhận đơn hàng và sẵn sàng khâu vận chuyển. Hãy thao tác xác nhận trên hệ thống admin!
                    </p>
                    <a href="http://localhost:8080/LaptopHub/">LAPTOPHUB</a>
                </div>
            </div>
            <div class="footer">
                <p>Trường Đại học FPT phân hiệu Đà Nẵng, Khu Công nghệ cao, Ngũ Hành Sơn, Đà Nẵng, Việt Nam</p>
                <p>&copy; 2024 LaptopHub</p>
            </div>
        </div>
    </body>
</html>
