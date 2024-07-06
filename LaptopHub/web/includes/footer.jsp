<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <style>
        .footer-clean01 {
            padding:50px 0;
            background-color:#b5b4b4;
            color:#4b4c4d;
            display: flex;
            flex-direction: column;
            min-height: 190px;
        }

        .footer-clean01 h3 {
            margin-top:0;
            margin-bottom:12px;
            font-weight:bold;
            font-size:16px;
        }

        .footer-clean01 ul {
            padding:0;
            list-style:none;
            line-height:1.6;
            font-size:14px;
            margin-bottom:0;
        }

        .footer-clean01 ul a {
            color:inherit;
            text-decoration:none;
            opacity:0.8;
        }

        .footer-clean01 ul a:hover {
            opacity:1;
        }

        .footer-clean01 .item.social {
            text-align:right;
        }

        @media (max-width:767px) {
            .footer-clean01 .item {
                text-align:center;
                padding-bottom:20px;
            }
        }

        @media (max-width: 768px) {
            .footer-clean01 .item.social {
                text-align:center;
            }
        }

        .footer-clean01 .item.social > a {
            font-size:24px;
            width:40px;
            height:40px;
            line-height:40px;
            display:inline-block;
            text-align:center;
            border-radius:50%;
            border:1px solid #ccc;
            margin-left:10px;
            margin-top:22px;
            color:inherit;
            opacity:0.75;
        }

        .footer-clean01 .item.social > a:hover {
            opacity:0.9;
        }

        @media (max-width:991px) {
            .footer-clean01 .item.social > a {
                margin-top:40px;
            }
        }

        @media (max-width:767px) {
            .footer-clean01 .item.social > a {
                margin-top:10px;
            }
        }

        .footer-clean01 .copyright {
            margin-top:14px;
            margin-bottom:0;
            font-size:13px;
            opacity:0.6;
        }
        img{
            display: block;
            width: 70px;
            height: auto;
            transform: scale(1.5);
            transform-origin: center;
            padding:  0 auto;
        }
        .rowLap{
            display: flex;
            justify-content: space-between;
            margin: 10px 70px;
        }
    </style>
    <div>
    <div class="footer-clean01">
        <footer>
            <div>
                <div class="rowLap">
                    <div class=" item">
                        <h3>Tổng đài hỗ trợ</h3>
                        <ul>
                            <li><a href="#">Mua hàng: 09786468364</a></li>
                            <li><a href="#">Bảo hành: 09786468364</a></li>

                        </ul>
                    </div>
                    <div class=" item">
                        <h3>Dịch vụ và thông tin khác</h3>
                        <ul>
                            <li><a href="#">Ưu đãi</a></li>
                            <li><a href="#">Quy chế</a></li>
                            <li><a href="#">Chính sách bảo hành</a></li>
                        </ul>
                    </div>
                    <div class=" item">
                        <h3>Thông tin</h3>
                        <ul>
                            <li><a href="#">Chính sách giao hàng</a></li>
                            <li><a href="#">Trả góp online</a></li>
                            <li><a href="#">Hóa đơn</a></li>
                        </ul>
                    </div>
                    <div class=" item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a>
                        <p class="copyright">Laptop Hub © 2024</p>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    </div>