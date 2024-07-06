<%-- 
    Document   : profile
    Created on : Jun 16, 2024, 9:00:37 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="./css/profile.css">
    </head>
    <%@include file="/includes/header.jsp" %>
    <body>
        <c:set var="user" value="${requestScope.USER}"></c:set>
        <div>
            <div class="user-general">
                <img src="${user.getImage()}" alt="Ảnh Đại Diện"/>
                <div class="info-general">
                    <h3>Tài Khoản: ${user.getUserName()}</h3>
                    <h5>ID: ${user.getUserId()}</h5>
                </div>
            </div>
            <div class="info">
                <div class="left-side">
                    <ul>
                        <a href="ProfileServlet"><li class="your-account">Tài Khoản Của Bạn</li></a>
                        <a href="ProfileServlet?cmd=load"><li>Cập Nhật Thông Tin Cá Nhân</li></a>
                        <a href="CartServlet?action=showcart"><li>Giỏ Hàng Của Bạn</li></a>
                        <a href="#"><li>Cập Nhật Số Dư</li></a>
                        <a href="#"><li>Đổi Mật Khẩu</li></a>
                        <a href="#"><li>Hỗ Trợ Khách Hàng</li></a>
                    </ul>
                </div>
                <div class="right-side">
                    <table>
                        <tr>
                            <td>Họ và Tên:</td>
                            <td>${user.getFullName()}</td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>${user.getEmail()}</td>
                        </tr>
                        <tr>
                            <td>Số Điện Thoại:</td>
                            <td>${user.getPhone()}</td>
                        </tr>
                        <tr>
                            <td>Ngày Sinh:</td>
                            <td>${user.getBirthdayString(user.getBirthday())}</td>
                        </tr>
                        <tr>
                            <td>Địa Chỉ:</td>
                            <td>${user.getAddress()}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <%@include file="/includes/footer.jsp" %>
</html>
