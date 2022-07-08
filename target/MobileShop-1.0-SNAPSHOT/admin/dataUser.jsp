<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
    <jsp:include page="/admin/sub-component/header-admin.jsp"/>
</head>

<body>
<div class="d-flex" id="wrapper">

    <jsp:include page="/admin/sub-component/menu-admin.jsp"/>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

        <jsp:include page="/admin/sub-component/top-menu-admin.jsp"/>


        <div class="container-fluid">
            <div class="mb-5 mt-3 ">
                <div class="content">
                    <div class="animated fadeIn">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class=" mb-2">
                                            <h4 class="text-center mt-3 mb-4">Danh sách khách hàng</h4>
                                            <div class="row">
                                                <div class="show-page mb-3 ml-3">
                                                    <span>  Hiển thị</span>
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

                                                <div class="show-page  arrange">

                                                    <span> Sắp xếp</span>
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
                                            </div>
                                            <table id="bootstrap-data-table"
                                                   class="table table-hover table-text-center border">
                                                <thead class="thead-light">
                                                <tr>
                                                    <th><span data-toggle="tooltip" data-placement="top"
                                                              title="Mã khách hàng">Mã KH</span>
                                                    </th>
                                                    <th>Họ tên</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Địa chỉ mặc định</th>
                                                    <th>Trạng thái</th>
                                                    <th>Email</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody id="content-table">
                                                <tr>
                                                    <td>KH01</td>
                                                    <td>Tiger</td>
                                                    <td>0123456779</td>
                                                    <td>Linh Xuân, Thủ Đức</td>
                                                    <td>Mở</td>
                                                    <td>tiger@gmail.com</td>

                                                    <td class="row" style="border: none;">
                                                        <div style="margin: auto;">
                                                            <button class="btn btn-success sizeTh1" value="true"
                                                                    id='block' data-placement="top"
                                                                    title="Block" data-target="#block-user"
                                                                    data-toggle="modal"><i
                                                                    class="txt-center fas fa-lock"></i></button>

                                                        </div>


                                                        <div class="modal fade" id='block-user' tabindex="-1"
                                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">
                                                                            Xác nhận chặn</h5>
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal" aria-label="Close">
                                                                            <i aria-hidden="true">&times;</i>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Bạn có muốn xác nhận chặn user này không?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-dismiss="modal">Hủy
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary"
                                                                                onclick="check_block('block') "
                                                                                data-dismiss="modal">Xác
                                                                            nhận
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>

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

    <script src="<c:url value="/assets/js/js_admin/divide-page.js"/>"></script>
    <script src="<c:url value="/assets/js/js_admin/user-confirmed.js"/>"></script>

    <!-- Menu Toggle Script -->
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>

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


    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>

</body>

</html>