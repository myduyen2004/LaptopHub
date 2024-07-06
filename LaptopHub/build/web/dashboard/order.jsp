<%-- 
    Document   : account
    Created on : Jun 20, 2024, 10:17:28 PM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Quản lí đơn hàng</title>
        <link rel="icon" href="assets/img/kaiadmin/favicon.ico" type="image/x-icon"/>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
    </head>
    <body>
        <%@include file="left-container.jsp" %>
        <%@include file="nav-admin.jsp" %>

        <div class="container">
            <div class="page-inner">
                <div class="page-header">
                    <h3 class="fw-bold mb-3">TÀI KHOẢN KHÁCH HÀNG</h3> 
                </div>


                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex align-items-center">

                                <button
                                    class="btn btn-primary btn-round ms-auto"
                                    data-bs-toggle="modal"
                                    data-bs-target="#addRowModal"
                                    >
                                    <i class="fa fa-plus"></i>
                                    Thêm đơn hàng
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <!-- Modal -->

                            <div class="table-responsive">
                                <table
                                    id="add-row"
                                    class="display table table-striped table-hover"
                                    >
                                    <thead>
                                        <tr>
                                            <th>Khách hàng</th>
                                            <th>Mã đơn hàng</th>
                                            <th>Thời gian</th>
                                            <th>Địa chỉ</th>
                                            <th>Chi tiết</th>
                                            <th style="width: 10%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><div class="avatar">
                                                    <img src="assets/img/jm_denis.jpg" alt="..." class="avatar-img rounded-circle">
                                                </div></td>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td><button
                                                    type="button"
                                                    data-bs-toggle="tooltip"
                                                    title=""
                                                    class="btn btn-link btn-danger"
                                                    data-original-title="View"
                                                    >
                                                    <i class="fas fa-info"></i>
                                                </button></td>
                                            <td> 
                                                <div class="form-button-action">
                                                    <button
                                                        type="button"
                                                        data-bs-toggle="tooltip"
                                                        title=""
                                                        class="btn btn-link btn-primary btn-lg"
                                                        data-original-title="Edit Task"
                                                        >
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    <button
                                                        type="button"
                                                        data-bs-toggle="tooltip"
                                                        title=""
                                                        class="btn btn-link btn-danger"
                                                        data-original-title="Remove"
                                                        >
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>



                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
            },
        });

        // Add Row
        $("#add-row").DataTable({
            pageLength: 5,
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
                        action,
                    ]);
            $("#addRowModal").modal("hide");
        });
    });
</script>
</body>
</html>
