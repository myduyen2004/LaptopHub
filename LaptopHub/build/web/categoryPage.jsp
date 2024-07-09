<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/includes/header.jsp" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${category} Products</title>
        <link rel="stylesheet" type="text/css" href="css/product.css">
        <script src="JavaScript/sortProducts.js"></script>
        <style>
            .search-bar.Laptop {
                background-image: url(https://www.acervietnam.com.vn/wp-content/uploads/2023/01/predator-laptop-helios-18-beyond-performance-1-scaled.webp);
            }

            .search-bar.Tablet {
                background-image: url(https://genk.mediacdn.vn/139269124445442048/2022/8/17/gsmarena002-1660754101150-1660754101303553007588.jpg);
            }

            .search-bar.PC {
                background-image: url(https://cdn.tgdd.vn/News/0/Screenshot2024-03-28at17.38.27-1280x558.jpg);
            }

            .search-bar.Screen {
                background-image: url(https://cdn.tgdd.vn/News/0/h2-1280x720-152.jpg);
            }
            .animate-charcter
            {
                text-transform: uppercase;
                background-image: linear-gradient(
                    -225deg,
                    #231557 0%,
                    #44107a 29%,
                    #ff1361 67%,
                    #fff800 100%
                    );
                background-size: auto auto;
                background-clip: border-box;
                background-size: 200% auto;
                color: #fff;
                background-clip: text;
                text-fill-color: transparent;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                animation: textclip 2s linear infinite;
                display: inline-block;
                font-size: 40px;
            }

            @keyframes textclip {
                to {
                    background-position: 200% center;
                }
            }
            .price{
                background-color: #460E6D;
                color: rgb(255, 255, 255);
                border: solid #460E6D;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                border-radius: 20px;
                margin-left: 35px;
            }
            .link{
                text-decoration: none;
            }
            .link{
                background-color: white;
                color: black;
                border: 2px solid #460E6D;
                padding: 10px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                margin: 10px 40px;
                border-radius: 20px;
            }

            .link:hover, .link:active {
                background-color: #460E6D;
                color: white;

            }
        </style>
    </head>
    <body>
        <div>
            <div class="search-bar ${category}">
                <div class="wrap">

                </div>
            </div>

            <div class="all-product">
                <div class="title">
                    <h3 class="animate-charcter"> ${category}</h3>

                </div>
                <div class="custom-dropdown">
                    <button class="custom-dropbtn">Sắp xếp theo giá</button>
                    <div class="custom-dropdown-content">
                        <a href="#" onclick="sortProducts('.main-product', 'asc')">Giá tăng dần</a>
                        <a href="#" onclick="sortProducts('.main-product', 'desc')">Giá giảm dần</a>
                    </div>
                </div>


                <div class="main-product">
                    <c:forEach var="product" items="${products}">
                        <div class="each-product">
                            <div class="image">
                                <c:forEach var="img" items="${product.getImageList()}">
                                    <c:if test="${img.description == 'Mặt trước'}">
                                        <img class="imgProduct" src="${img.getImageUrl()}" alt="${img.getDescription()}">
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="product">
                                <h4 class="name">${product.getProductName()}</h4>
                                <div class="info">
                                    <p>Siêu ưu đãi:</p> <p class="sale">${product.getPricePerUnit()}VND</p><br>
                                    <h4 class="price">${product.getPricePerUnitAfterDiscount()}VND</h4>   
                                </div>
                            </div>
                            <br>
                            <a class="link" href="./home?action=DETAILS&id=${product.getProductId()}"><p>Chi tiết sản phẩm >></p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <%@include file="/includes/footer.jsp" %>
        </div>
    </body>
</html>