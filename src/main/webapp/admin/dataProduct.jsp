<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
    <jsp:include page="/sub-component/header-admin.jsp"/>
    <title></title>
</head>

<body>
<div class="d-flex" id="wrapper">

    <jsp:include page="/sub-component/menu-admin.jsp"/>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

        <jsp:include page="/sub-component/top-menu-admin.jsp"/>

        <div class="container-fluid">
            <div class="mb-5 mt-3 ">
                <div class="content">
                    <div class="animated fadeIn">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class=" mb-2">
                                            <h4 class="text-center mt-3 mb-4">Danh sách sản phẩm</h4>
                                            <div class="row">
                                                <div class="show-page mb-3 ml-3">

                                                    <span> Hiển thị </span>
                                                    <label for="show-row"></label>
                                                    <select id="show-row" onclick="select_page()">
                                                        <option value="10">
                                                            10 dòng
                                                        </option>
                                                        <option value="20">
                                                            20 dòng
                                                        </option>
                                                        <option value="50">
                                                            50 dòng
                                                        </option>
                                                    </select>
                                                </div>

                                                <div class="show-page arrange">

                                                    <span> Sắp xếp </span>
                                                    <label for="show"></label>
                                                    <select id="show" onclick="select_page()">
                                                        <option value="10">
                                                            A-Z
                                                        </option>
                                                        <option value="20">
                                                            Z-A
                                                        </option>
                                                    </select>
                                                </div>
                                                <div class="show-page arrange">
                                                    <label for="myInput"></label>
                                                    <input id="myInput" type="text" class="input-form"
                                                                                        placeholder="Tìm kiếm">
                                                </div>

                                                <a href="../admin/formAddProduct.jsp" style="display: block;">
                                                    <button data-toggle="tooltip" data-placement="top"
                                                            title="Thêm sản phẩm"
                                                            class="btn btn-success btn-add">
                                                        <i class="fas fa-plus-square"></i> Thêm sản phẩm
                                                    </button>
                                                </a>
                                            </div>

                                            <table id="bootstrap-data-table"
                                                   class="table table-hover table-text-center center-column border">
                                                <thead class="thead-light">
                                                <tr>
                                                    <th>Hình ảnh</th>
                                                    <th>Mã sản phẩm</th>
                                                    <th>Tên</th>
                                                    <th data-toggle="tooltip" data-placement="top"
                                                        title="Hãng sản xuất">Hãng SX
                                                    </th>
                                                    <th>Ngày ra mắt</th>
                                                    <th data-toggle="tooltip" data-placement="top"
                                                        title="Số lượng còn lại">SL còn lại
                                                    </th>
                                                    <th data-toggle="tooltip" data-placement="top"
                                                        title="Số lượng đã bán">SL đã bán
                                                    </th>
                                                    <th>Giá bán</th>
                                                    <th></th>

                                                </tr>
                                                </thead>

                                                <tbody id="content-table">
                                                <tr>
                                                    <td style="max-width: 140px;"><img
                                                            src="/assets/images/Product/i12black.png" width="100px"
                                                            height="100px" alt=""></td>
                                                    <td>iphone12S</td>
                                                    <td>Iphone 12</td>
                                                    <td>Apple</td>
                                                    <td>09/09/2020</td>
                                                    <td>200</td>


                                                    <td>190</td>
                                                    <td class="color-price">30.000.000 VND</td>
                                                    <td class="row">
                                                        <div class="container-button">
                                                            <a href="../admin/formEdit.jsp">
                                                                <button class="m-wTD btn btn-primary"
                                                                        data-toggle="tooltip"
                                                                        data-placement="top" title="Chỉnh sửa"
                                                                        data-toggle="modal"
                                                                        data-target="#editUser"><i
                                                                        class="txt-center fas fa-edit"></i></button>
                                                            </a>
                                                            <button class="btn btn-danger sizeTh1" data-toggle="modal"
                                                                    data-target="#delete"
                                                                    data-toggle="tooltip" data-placement="top"
                                                                    title="Xóa"><i
                                                                    class="txt-center menu-icon fas fa-trash-alt"></i>
                                                            </button>
                                                        </div>

                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>

                                            <div class="page-navigation">
                                                <div class="beta">
                                                    <button onclick="previous_page()"> Trước</button>
                                                    <span id="page-number"></span>

                                                    <button onclick="next_page()"> Sau</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- .animated -->
                    </div><!-- .content -->

                </div><!-- /#right-panel -->
            </div>
        </div>
        <!-- /#page-content-wrapper -->
    </div>
    <!-- delete product -->
    <!-- Modal -->
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xác nhận xóa sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Bạn có muốn xóa sản phẩm này.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                    <button type="button" data-dismiss="modal" class="btn btn-primary">Đồng ý</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Right Panel -->

    <script src="<c:url value="/assets/js/js_admin/divide-page.js"/>"></script>
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#bootstrap-data-table-export').DataTable();
        });
    </script>


    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>

    <!-- search -->
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#content-table tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>


</body>

</html>