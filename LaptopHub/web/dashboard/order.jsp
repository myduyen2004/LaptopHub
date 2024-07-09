<%-- 
    Document   : product
    Created on : Jun 20, 2024, 9:53:04 PM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí đơn hàng</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
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
                    urls: ["assets/css/fonts.min.css"],
                },
                active: function () {
                    sessionStorage.fonts = true;
                },
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

        <style>
            .button-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 150px;
                margin-bottom: 20px;
            }

            .but {
                text-decoration: none;
                padding: 10px 10px;
                border-radius: 5px;
                font-size: 10px;
                transition: background-color 0.3s, color 0.3s;
            }

            .but.update {
                background-color: #4CAF50; /* Green */
                color: white;
            }

            .but.update:hover {
                background-color: #45a049;
            }

            .but.delete {
                background-color: #f44336; /* Red */
                color: white;
            }

            .but.delete:hover {
                background-color: #da190b;
            }
            .but.detail {
                background-color: #0066FF; /* Red */
                color: white;
            }

            .but.detail:hover {
                background-color: #0066CC;
            }
        </style>
    </head>
    <body>
        <%@include file="left-container.jsp" %>
        <%@include file="nav-admin.jsp" %>
        <div class="container">
            <div class="page-inner">
                <div class="page-header">
                    <h3 class="fw-bold mb-3">QUẢN LÍ ĐƠN ĐẶT HÀNG</h3> 
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <button type="submit" class="btn btn-search pe-1">
                            <i class="fa fa-search search-icon"></i>
                        </button>
                    </div>
                    <input
                        type="text"
                        placeholder="Tìm kiếm sản phẩm ..."
                        class="form-control"
                        />
                </div>
                <div class="col-md-12">
                    <div class="card">
                        <!--                        <div class="card-header">
                                                    <div class="d-flex align-items-center">
                                                        <script type="text/javascript">
                                                            function redirectToPage() {
                                                                window.location.href = './dashboard/add-product-form.jsp';
                                                            }
                                                        </script>
                                                        <button
                                                            class="btn btn-primary btn-round ms-auto"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#addRowModal"
                                                            onclick= "redirectToPage()"
                                                            >
                                                            <i class="fa fa-plus"></i>
                                                            Thêm đơn hàng
                                                        </button>
                                                    </div>
                                                </div>-->
                        <div class="card-body">
                            <!-- Modal -->

                            <div class="table-responsive">
                                <table
                                    id="add-row"
                                    class="display table table-striped table-hover"
                                    >
                                    <thead>
                                        <tr>
                                            <th>Mã đơn hàng</th>
                                            <th>Tên đăng nhập</th>
                                            <th>Thời gian</th>
                                            <th>Địa chỉ</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                            <th style="width: 5%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var= "order" items= "${orderList}" >
                                            <c:url var= "confirm" value="./manageord">
                                                <c:param name="command" value="LOAD"></c:param>
                                                <c:param name="orderId" value="${order.getOrderId()}"></c:param>
                                            </c:url>
                                            <c:url var= "cancel" value="./manageord">
                                                <c:param name="command" value="CANCEL"></c:param>
                                                <c:param name="orderId" value="${order.getOrderId()}"></c:param>
                                            </c:url>
                                            <c:url var= "delete" value="./manageord">
                                                <c:param name="command" value="DELETE"></c:param>
                                                <c:param name="orderId" value="${order.getOrderId()}"></c:param>
                                            </c:url>
                                            <tr>
                                                <td>${order.getOrderId()}</td>
                                                <td>${order.getUserName().getUserName()}</td>
                                                <td>${order.getDate()} <strong> ${order.getTime()}</strong></td>
                                                <td>${order.getAddress()}</td>
                                                <td>${order.getTotalMoneyString()}</td>
                                                <td>${order.getStatusString()}</td>
                                                <td>


                                                    <div class="button-container">
                                                        <a href="${delete}" class="but delete" onclick="if (!(confirm('Sure?')))
                                                                    return false">Xóa đơn hàng</a>
                                                        <c:if test="${order.getStatusString() != 'Đã xác nhận'}">
                                                            <a href="${confirm}" class=" but detail">Xác nhận</a>
                                                        </c:if>
                                                            <c:if test="${order.getStatusString() == 'Đã xác nhận'}">
                                                    <a href="${cancel}" class="but update">Hủy đơn hàng</a>
                                                </c:if>
                                                    </div>
                                                </td>
                                                
                                            </tr>

                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
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

        <!-- Custom template | don't include it in your project! -->

        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>
        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo2.js"></script>
        <script>
                                                            $(document).ready(function () {
                                                                $("#basic-datatables").DataTable({});
                                                                $("#multi-filter-select").DataTable({
                                                                    pageLength: 5,
                                                                    initComplete: function () {
                                                                        this.api()
                                                                                .columns()
                                                                                .every(function () {
                                                                                    var column = this;
                                                                                    var select = $(
                                                                                            '<select class="form-select"><option value=""></option></select>'
                                                                                            )
                                                                                            .appendTo($(column.footer()).empty())
                                                                                            .on("change", function () {
                                                                                                var val = $.fn.dataTable.util.escapeRegex($(this).val());

                                                                                                column
                                                                                                        .search(val ? "^" + val + "$" : "", true, false)
                                                                                                        .draw();
                                                                                            });

                                                                                    column
                                                                                            .data()
                                                                                            .unique()
                                                                                            .sort()
                                                                                            .each(function (d, j) {
                                                                                                select.append(
                                                                                                        '<option value="' + d + '">' + d + "</option>"
                                                                                                        );
                                                                                            });
                                                                                });
                                                                    }
                                                                });

                                                                // Add Row
                                                                $("#add-row").DataTable({
                                                                    pageLength: 5
                                                                });

                                                                var action =
                                                                        '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

                                                                $("#addRowButton").click(function () {
                                                                    $("#add-row")
                                                                            .dataTable()
                                                                            .fnAddData([
                                                                                $("#addName").val(),
                                                                                $("#addPosition").val(),
                                                                                $("#addOffice").val(),
                                                                                action
                                                                            ]);
                                                                    $("#addRowModal").modal("hide");
                                                                });
                                                            });
        </script>
    </body>
</html>



