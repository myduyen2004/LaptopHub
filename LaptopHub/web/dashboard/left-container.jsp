<%-- 
    Document   : container
    Created on : Jun 19, 2024, 10:04:46 PM
    Author     : myduyen
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta
        content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        name="viewport"
        />
    <!-- Fonts and icons -->
    <script src="../assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
        WebFont.load({
            google: {families: ["Public Sans:300,400,500,600,700"]},
            custom: {
                families: [
                    "Font Awesome 5 Solid",
                    "Font Awesome 5 Regular",
                    "Font Awesome 5 Brands",
                    "simple-line-icons",
                ],
                urls: ["../assets/css/fonts.min.css"],
            },
            active: function () {
                sessionStorage.fonts = true;
            },
        });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/plugins.min.css" />
    <link rel="stylesheet" href="../assets/css/kaiadmin.min.css" />
</head>
<div class="wrapper">
    <!-- Sidebar -->
    <div class="sidebar" data-background-color="dark">
        <div class="sidebar-logo">
            <!-- Logo Header -->
            <div class="logo-header" data-background-color="dark">
                <a href="HomeServlet" class="logo" style="list-style: none; color: white">
                    <img style="width: 90px; height: auto; "
                         src="images/logo/logo.png"
                         alt="navbar brand"
                         class="navbar-brand"
                         height="20"
                         />LAPTOPHUB
                </a>

                <div class="nav-toggle">
                    <button class="btn btn-toggle toggle-sidebar">
                        <i class="gg-menu-right"></i>
                    </button>
                    <button class="btn btn-toggle sidenav-toggler">
                        <i class="gg-menu-left"></i>
                    </button>
                </div>
            </div>
            <!-- End Logo Header -->
        </div>
        <div class="sidebar-wrapper scrollbar scrollbar-inner">
            <div class="sidebar-content">
                <ul class="nav nav-secondary">
                    <li class="nav-item">
                        <a 
                            href="HomeServlet"
                            class="collapsed"
                            >
                            <i class="fas fa-home"></i>
                            <p>Trang chủ</p>
                        </a>
                    </li>
                    <li class="nav-section">
                        <span class="sidebar-mini-icon">
                            <i class="fa fa-ellipsis-h"></i>
                        </span>
                        <h4 class="text-section">Quản lí</h4>
                    </li>
                    <li class="nav-item">
                        <a href="DashboardServlet" >
                            <i class="fas fa-desktop"></i>
                            <p>Tổng quan</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="ProductManagement">
                            <i class="fas fa-layer-group"></i>
                            <p>Sản phẩm</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="">
                            <i class="fas fa-th-list"></i>
                            <p>Tài khoản</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="">
                            <i class="fas fa-pen-square"></i>
                            <p>Doanh thu</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="ProductManagement">
                            <i class="far fa-chart-bar"></i>
                            <p>Nhà cung cấp</p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="ProductManagement">
                            <i class="fas fa-bars"></i>
                            <p>Đơn dặt hàng</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>