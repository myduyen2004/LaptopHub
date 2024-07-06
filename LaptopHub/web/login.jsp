<%-- 
    Document   : login
    Created on : Jun 16, 2024, 9:00:15 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import= "laptophub.utils.CookieUtils" %>    
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <title>Login form</title>
        <style>
            .h3{
                font-weight: bold;
            }
            .login {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .login-header {
                margin-bottom: 1rem;
            }
            .footer-clean{
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
            }
            .login{
                padding-top: 57px;
            }
            .dangky{
                color: #660066
            }
            .btn-primary {
                background-color: #660066/* Màu nền */
            }

            .btn-primary:hover {
                background-color: #460e6d /* Màu nền khi di chuyển chuột vào */

            }
            .inline-block {
                display: inline-block;
            }
            .forgotpass{
                margin-left: 200px;
                text-decoration: none;
                color: #660066;
                margin-left: 240px
            }
            .btn-long {
                width: 100%;
                max-width: 300px; /* Đặt một giới hạn độ rộng nếu cần */
                margin: 10px auto; /* Căn giữa nút và thêm lề trên dưới */
            }
        </style>
    </head>
    <body>
        <jsp:include page="/includes/header.jsp"/>
        <%
          String username = CookieUtils.get("cookuser", request);
          String password = CookieUtils.get("cookpass", request);
          String rememberVal = CookieUtils.get("cookrem", request);
        %>

        <div class="row content--">

            <div class="login">
                <p class="h3">Đăng nhập</p>
                <form action="LoginServlet" method="POST">
                    <%=request.getAttribute("msg")!=null?request.getAttribute("msg") : ""%>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Tên đăng nhập</label>
                        <br>
                        <input type="text" class="form-control" name="username" autocomplete="off" value="<%=username%>" aria-describedby="emailHelp" placeholder="Tên đăng nhập"/>

                        <br>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1" >Mật khẩu</label>
                        <br>
                        <input type="password" class="form-control" name="password" size="50" autocomplete="off" value="<%=password%>" placeholder="Mật khẩu"/>
                    </div>
                    <div class="form-group form-check" style="padding: 0px">
                        <br>
                        <input type="checkbox" class name="remember" value="1"
                               <%= "1".equals(rememberVal.trim()) ?"checked=\"checked\"" : ""%> />
                        <label class="form-check-label" for="exampleCheck1">Ghi nhớ mật khẩu</label> 
                        <a href="authentication/verify-gmail.jsp" class="forgotpass" >Quên mật khẩu?</a>
                        <br>

                        <button type="submit" class="btn btn-primary" style<button type="submit" class="btn btn-primary" style="
                                                                                   height: 49px;
                                                                                   width: 486px;
                                                                                   padding-right: 1px;
                                                                                   padding-left: 0px;
                                                                                   border-left-width: 0px;
                                                                                   margin-left: 7px;
                                                                                   margin-left: 3px;
                                                                                   margin-right: 0px;
                                                                                   margin-top: 10px;
                                                                                   margin-bottom: 20px"
                                                                                   >Login</button>
                            <br>
                            <div class="inline-block">Bạn chưa có tài khoản ?</div> 
                            <a href="signup.jsp" class="dangky" > đăng ký ngay.</a>
                    </div>                       

                    <br>
                </form>
            </div> 
        </div>
        <script>
            // Kiểm tra xem có thông báo thành công hay không
            <% if (request.getAttribute("success") != null) { %>
            toastr.success('<%= request.getAttribute("success") %>');
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
            toastr.error('<%= request.getAttribute("error") %>');
            <% } %>
        </script>                


    </body>

</html>
<jsp:include page="/includes/footer.jsp"/>



