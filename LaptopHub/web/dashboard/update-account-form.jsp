<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Account</title>
        <link rel="stylesheet" type="text/css" href="path/to/your/css/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="icon" href="assets/img/kaiadmin/favicon.ico" type="image/x-icon"/> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    </head>
    <style>
        body {
                background-color: #f5f5f5;
            }
            .card-header {
                font-weight: bold;
                background-color: #fff;
                border-bottom: none;
            }

            .card-body {
                background-color: #fff;
            }

            .btn-outline-secondary {
                margin-right: 5px;
                margin-bottom: 5px;
            }
            .btn-block {
                margin-top: 10px;
            }
            .container01{
                background-color: #ffffff;
                width: 100%;
                min-width: 450px;
                position: relative;
                margin:  10px auto;
                padding: 0px 20px;
                border-radius: 7px;
                box-shadow: 0 20px 35px rgba(0,0,0,0.05);
            }

            .label{
                display: block;
                position: relative;
                background-color: #025bee;
                color: #ffffff;
                font-size: 18px;
                text-align: center;
                width: 300px;
                padding: 18px 0;
                margin: auto;
                border-radius: 5px;
                cursor: pointer;
            }
    </style>
    <body>
        <%@include file="../includes/header.jsp" %>
        <form action="./manageacc" method="get" enctype="multipart/form-data">
            <input type="hidden" name="command" value="UPDATE">
            <input type="hidden" name="userId"
                   value="${USER.getUserId()}">
            <div class="container mt-5" >
                <h2 class="mb-4" style="padding-left: 50px; padding-top: 50px">Cập nhật thông tin người dùng</h2>
                <div class="row">
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header">
                                Thông tin chung
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="userName">User Name:</label>
                                    ${USER.getUserName()}
                                </div>
                                <input type="hidden" name="username" value="${USER.getUserName()}">
                                <div class="form-group">
                                    <label for="fullName">Full Name:</label>
                                    <input type="text" name="fullname" value="${USER.getFullName()}" >
                                </div>
                                <div class="form-group row">
                                    <label for="role">Role:</label>
                                    <select  class="form-control" name = "role" value="${USER.roleString()}">
                                        <option value="Admin">Admin</option>
                                        <option value="User">Khách hàng</option>
                                        <!-- Add more roles as needed -->
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password:</label>
                                    <input type="password" name="password" value="${USER.getPassword()}" >
                                </div>

                                <div class="form-group">
                                    <label for="birthday">Birthday:</label>
                                    <input type="date"name="birthday" value="${USER.birthdayString()}" >
                                </div>

                                <div class="form-group">
                                    <label for="address">Address:</label>
                                    <input type="text" name="address" value="${USER.getAddress()}" >
                                </div>

                                <div class="form-group ">
                                    <label for="phone">Phone Number:</label>
                                    <input type="tel" name="phone" value="${USER.getPhone()}" >
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select class="form-control" name = "status" value="${USER.statusString()}">
                                        <option value="Active">Hoạt động</option>
                                        <option value="Non-active">Ngưng hoạt động</option>
                                        <!-- Add more roles as needed -->
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="text" name="email" value="${USER.getEmail()}" >
                                </div>
                                <input type="submit" class="btn btn-primary btn-block" value="Update User">
                                <a href="../ManageAccount" type="button" class="btn btn-secondary btn-block">Quay trở lại trang quản trị</a>

                            </div>
                        </div>
                    </div>
                </div>
                                </div>

                    <br><br>                    
                    </form>                       
                    </body>
                    </html>