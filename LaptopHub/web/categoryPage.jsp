<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/includes/header.jsp" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${category} Products</title>
        <link rel="stylesheet" type="text/css" href="css/product.css">
        <script src="js/sortProducts.js"></script>
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
            
            <div class="all-product">
                <div class="title">
                    <h2>${category}</h2>
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
                                    <p>Siêu ưu đãi:</p> <p class="sale">${product.getPricePerUnit()}VND</p>
                                    <h4 class="price">${product.getPricePerUnitAfterDiscount()}VND</h4>   
                                </div>
                            </div>
                            <a class="link" href="ProductDetail?id=${product.getProductId()}"><p>Chi tiết sản phẩm >></p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <%@include file="/includes/footer.jsp" %>
        </div>
    </body>
</html>
