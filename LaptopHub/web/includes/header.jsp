<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import= "laptophub.utils.CookieUtils" %> 
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    *{
        margin: 0;
        font-family: "Times New Roman", Times, serif;
    }
    .navbar01{
        background: linear-gradient(to right, #000, #460E6D);
        color: white;
    }
    .navbar-menu01{
        position: relative;
        list-style-type: none;
        display: flex;
        justify-content: space-between;
    }
    img{
        display: block;
        width: 70px;
        height: auto;
        transform: scale(1.5);
        transform-origin: center;
        padding:  0 auto;
    }
    .personal{
        width: 220px;
        margin: 25px 10px;
    }
    .personal a{
        margin-left: 15px;
    }

    /*    .personal .cart-icon{
            display: inline;
        }*/

    .navbar-menu01 li:not(.logo, .personal){
        z-index: 1;
        position: relative;
        margin: 25px 45px;
    }
    .navbar-menu01 li a{
        color: white;
        text-decoration: none;
    }
    .navbar-menu01 li{
        z-index: 1;
    }

    .icon a{
        color: white;
    }

    /* Dropdown Button */
    .dropbtn {
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
    }

    /* The container <div> - needed to position the dropdown content */
    .dropdown {
        position: relative;
        display: inline-block;
    }

    /* Dropdown Content (Hidden by Default) */
    .dropdown-content {
        margin-top: 10px;
        display: none;
        position: absolute;
        background: linear-gradient(45deg, #0c0c0c,#262527);
        min-width: 210px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    /* Links inside the dropdown */
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    /* Change color of dropdown links on hover */
    .dropdown-content a:hover {
        background-color: #ffffff;
        color: #27112e;
        font-weight: bold;

    }

    /* Show the dropdown menu on hover */
    .dropdown:active .dropdown-content,
    .dropdown:hover .dropdown-content {
        display: block;
    }

    /* Change the background color of the dropdown button when the dropdown content is shown */
    .dropdown:hover .dropbtn {
        background-color: transparent;
    }
    span{
        position: absolute;
        top: 0;
        left: 0;
        width: 200px;
        height: 100%;
        background: linear-gradient(45deg, #0c0c0c,#262527);
        border-radius: 8px;
        transition: .5s;
    }
    .navbar-menu01 li:nth-child(1):hover~span{
        left: 0;
    }
    .navbar-menu01 li:nth-child(2):hover~span{
        left: 400px;
        width: 210px;
        ;
    }

    .navbar-menu01 li:nth-child(4):hover~span{
        left: 920px;
        width: 200px;
    }

    .quantity-cart{
        background-color: #fff;
        border: .125rem solid var(--brand-primary-color, #9c68df);
        border-radius: 2.75rem;
        color: violet;
        height: 16px;
        width: 12px;
        padding: 0 .3125rem;
        position: relative;
        right: 10px;
        bottom: 10px;
        text-align: center;
    }


</style>
<div class="navbar01">
    <%
        String name = (String)request.getSession().getAttribute("sessuser");
        String size = CookieUtils.get(name+"size", request);
    %>
    <ul class="navbar-menu01">
        <li><a href ="HomeServlet">TRANG CHỦ</a></li>
        <li class="dropdown">
            <a href="" class="dropbtn">PHÂN LOẠI</a>
            <div class="dropdown-content">
                <a href="HomeServlet?action=Laptop">Laptop</a>
                <a href="HomeServlet?action=Tablet">Máy tính bảng</a>
                <a href="HomeServlet?action=Screen">Màn hình</a>
                <a href="HomeServlet?action=PC">PC</a>
            </div>
        </li>
        <li class="logo">
            <a href="HomeServlet"><img src="http://localhost:8080/LaptopHubWeb/images/logo/logo.png" alt="logo"/></a>
        </li>
        <li><a href="aboutUs.jsp">VỀ CHÚNG TÔI</a></li>
        <li class="personal">
            <% 
        Object roleId = session.getAttribute("roleId");
            if (roleId != null && roleId.equals(2)) { 
            %>
            <a href="DashboardServlet"><i class="fa-solid fa-list-check"></i></a>
                <% 
                    } 
                %>

            <a href="#"><i class="fas fa-bell"></i></a>
            <div class="cart-icon" style="display: inline"> 
                <a href="CartServlet?action=showcart">
                    <i class="fas fa-shopping-cart"></i>
                </a>

            </div>
            <%if (session.getAttribute("sessuser") == null){%>
            <a href="login.jsp" class="dropbtn"><i class="fas fa-user"></i></a>

            <%}else{%>
            <% 
                Object sizeSession = session.getAttribute("size");
                if (sizeSession != null) { 
            %>
            <div class="quantity-cart" style="display: inline">${sessionScope.size} </div>
            <%}else{%>
            <div class="quantity-cart" style="display: inline"><%=size%></div>
            <%}%>
            <a href="#" class=""><i class="fas fa-user"></i></a>
            <a href="LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i></a>
                <%}%>


        </li>
        <span></span>


    </ul>
</div>