<%-- supplier.jsp --%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="laptophub.dal.SupplierDAO"%>
<%@page import="laptophub.model.Supplier"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhà cung cấp</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport"/>
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
    </head>
    <body>
        <%@include file="left-container.jsp" %>
        <%@include file="nav-admin.jsp" %>

        <div class="container">
            <div class="page-inner">
                <div class="page-header d-flex justify-content-between">
                    <h3 class="fw-bold mb-3">NHÀ CUNG CẤP</h3>
                    <button type="button" class="btn btn-primary ml-auto" data-bs-toggle="modal" data-bs-target="#addSupplierModal"> Thêm Nhà Cung Cấp </button>
                </div>

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="supplierTable" class="display table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>NHÃN HIỆU</th>
                                            <th>ĐỊA ĐIỂM</th>
                                            <th>HOMEPAGE</th>
                                            <th>HÀNH ĐỘNG</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            SupplierDAO supplierDAO = new SupplierDAO();
                                            List<Supplier> suppliers = supplierDAO.getAllSupplier();
                                            for (Supplier supplier : suppliers) {
                                        %>
                                        <tr>
                                            <td>
                                                <div class="avatar">
                                                    <img src="<%= supplier.getImgLogo() %>" alt="<%= supplier.getCompanyName() %>" class="avatar-img rounded">
                                                </div>
                                            </td>
                                            <td><%= supplier.getCompanyName() %></td>
                                            <td><%= supplier.getCountry() %></td>
                                            <td><a href="<%= supplier.getHomePage() %>"><%= supplier.getHomePage() %></a></td>
                                            <td>
                                                <div class="form-button-action">
                                                    <button type="button" data-id="<%= supplier.getSupplierId() %>" 
                                                                          data-company="<%= supplier.getCompanyName() %>" 
                                                                          data-country="<%= supplier.getCountry() %>" 
                                                                          data-homepage="<%= supplier.getHomePage() %>" 
                                                                          class="btn btn-link btn-primary btn-lg edit-btn" data-bs-toggle="tooltip" title="Chỉnh Sửa Nhà Cung Cấp">
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    <button type="button" data-id="<%= supplier.getSupplierId() %>" class="btn btn-link btn-danger delete-btn" data-bs-toggle="tooltip" title="Xóa Nhà Cung Cấp">
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Supplier Modal -->
        <div class="modal fade" id="addSupplierModal" tabindex="-1" aria-labelledby="addSupplierModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSupplierModalLabel">Thêm Nhà Cung Cấp Mới</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addSupplierForm" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="companyName" class="form-label">Nhãn hiệu</label>
                                <input type="text" class="form-control" id="companyName" name="companyName" required>
                            </div>
                            <div class="mb-3">
                                <label for="country" class="form-label">Địa điểm</label>
                                <input type="text" class="form-control" id="country" name="country" required>
                            </div>
                            <div class="mb-3">
                                <label for="homePage" class="form-label">Homepage</label>
                                <input type="text" class="form-control" id="homePage" name="homePage" required>
                            </div>
                            <div class="mb-3">
                                <label for="imgLogo" class="form-label">Logo</label>
                                <input type="file" class="form-control" id="imgLogo" name="imgLogo" accept="image/*" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Thêm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Supplier Modal -->
        <div class="modal fade" id="editSupplierModal" tabindex="-1" aria-labelledby="editSupplierModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editSupplierModalLabel">Chỉnh Sửa Nhà Cung Cấp</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editSupplierForm" enctype="multipart/form-data">
                            <input type="hidden" id="editSupplierId" name="supplierId">
                            <div class="mb-3">
                                <label for="editCompanyName" class="form-label">Nhãn hiệu</label>
                                <input type="text" class="form-control" id="editCompanyName" name="companyName" required>
                            </div>
                            <div class="mb-3">
                                <label for="editCountry" class="form-label">Địa điểm</label>
                                <input type="text" class="form-control" id="editCountry" name="country" required>
                            </div>
                            <div class="mb-3">
                                <label for="editHomePage" class="form-label">Homepage</label>
                                <input type="text" class="form-control" id="editHomePage" name="homePage" required>
                            </div>
                            <div class="mb-3">
                                <label for="editImgLogo" class="form-label">Logo</label>
                                <input type="file" class="form-control" id="editImgLogo" name="imgLogo" accept="image/*">
                            </div>
                            <button type="submit" class="btn btn-primary">Cập Nhật</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Delete Supplier Modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xóa Nhà Cung Cấp</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p id="deleteMessage">Bạn có chắc chắn muốn xóa nhà cung cấp <span id="supplierName"></span> không?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <a id="deleteLink" href="#" class="btn btn-danger">Xóa</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Core JS Files -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>

        <script>
            $(document).ready(function () {
                $("#supplierTable").DataTable({
                    pageLength: 10
                });
                
                //add script
                $("#addSupplierForm").submit(function (event) {
                    event.preventDefault();
                    var formData = new FormData(this);

                    $.ajax({
                        type: "POST",
                        url: "SupplierServlet?action=add",
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            console.log("Supplier added successfully!");
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            console.error("Error adding supplier: " + error);
                        }
                    });
                });
                
                //edit script
                $("#supplierTable").on("click", ".edit-btn", function () {
                    var id = $(this).data("id");
                    var company = $(this).data("company");
                    var country = $(this).data("country");
                    var homepage = $(this).data("homepage");

                    $("#editSupplierId").val(id);
                    $("#editCompanyName").val(company);
                    $("#editCountry").val(country);
                    $("#editHomePage").val(homepage);
                    $('#editSupplierModal').modal('show');
                });

                $("#editSupplierForm").submit(function (event) {
                    event.preventDefault();
                    var formData = new FormData(this);

                    $.ajax({
                        type: "POST",
                        url: "SupplierServlet?action=edit",
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            console.log("Supplier updated successfully!");
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            console.error("Error updating supplier: " + error);
                        }
                    });
                });
                
                //delete script
                $("#supplierTable").on("click", ".delete-btn", function () {
                    var id = $(this).data("id");
                    var name = $(this).closest("tr").find("td:nth-child(2)").text();
                    $("#supplierName").text(name);
                    $("#deleteLink").attr("href", "./SupplierServlet?action=delete&id=" + id);
                    $('#deleteModal').modal('show');
                });
            });
        </script>
    </body>
</html>