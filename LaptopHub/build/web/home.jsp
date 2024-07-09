<%-- 
    Document   : home
    Created on : Jun 16, 2024, 9:00:06 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@include file="/includes/header.jsp" %>
<%@page import= "laptophub.utils.MoneyUtils" %>  
<head>
    <!-- Font Awesome Icon Library -->
    <meta charset=UTF-8>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/home.css"> 
    <style>
        .search-bar {
            height: 500px;
            width: 97.3%;
            background-image: url(https://cafefcdn.com/203337114487263232/2022/1/13/-1642085539868127292683.jpg);
            background-size: cover; /* Ensure the background image covers the entire container */
            background-position: center; /* Center the background image */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
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
    </style>
</head>
<body>
    <div>
        <div class="search-bar">
            <div class="wrap">
                <div class="search">
                    <input type="text" class="searchTerm" placeholder="Tìm kiếm sản phẩm..">
                    <button type="submit" class="searchButton">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="category">
            <div class="title">
                <h3 class="animate-charcter"> PHÂN LOẠI</h3>
            </div>
            <div class="detail">
                <c:forEach var="category" items="${categoryList}">
                    <div class="each-cate">
                        <div class="category-img">
                            <a class="cat" href="./home?action=${category.getCategoryName()}"><img src="${category.getImageCat()}" alt="${category.getDescription()}"></a>
                        </div>
                        <div class="name">
                            <a class="link" href= "./home?action=${category.getCategoryName()}"><h2>${category.getCategoryName()}</h2></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="top10-product">
            <div class="title">
                <h3 class="animate-charcter"> SẢN PHẨM MỚI</h3>
            </div>
            <div class="detail-top-10">
                <c:forEach var="product" items="${top10ProductList}">
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
                                <p>Siêu ưu đãi:</p> <p class="sale"> ${product.getPricePerUnit()}VND</p>
                                <h4 class="price">${product.getPricePerUnitAfterDiscount()}VND</h4>   
                            </div>
                            <div class="starRate">
                                <c:if test="${product.getStarRating()==0}">
                                    <i class="fa fa-star "></i>
                                    <i class="fa fa-star "></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </c:if>
                                <c:if test="${product.getStarRating()==1}">
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star "></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </c:if>
                                <c:if test="${product.getStarRating()==2}">
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </c:if>
                                <c:if test="${product.getStarRating()==3}">
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </c:if>
                                <c:if test="${product.getStarRating()==4}">
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star"></i>
                                </c:if>
                                <c:if test="${product.getStarRating()==5}">
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                    <i class="fa fa-star checked"></i>
                                </c:if>
                            </div>
                        </div>

                        <a class="link" href="./home?action=DETAILS&id=${product.getProductId()}"><p>Chi tiết sản phẩm >></p></a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
<%@include file="/includes/footer.jsp" %>