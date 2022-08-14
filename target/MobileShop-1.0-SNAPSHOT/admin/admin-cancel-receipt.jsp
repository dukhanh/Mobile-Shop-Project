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
    <!-- Sidebar -->
    <!--Nav-->
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
                                            <h4 class="text-center mt-3 mb-4">Danh sách đơn hàng bị hủy</h4>
                                            <div class="row">
                                                <div class="show-page mb-3 ml-3">
                                                    <span> Hiển thị</span>
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
                                                    <input id="myInput" type="text" class="input-form"
                                                           placeholder="Tìm kiếm">
                                                </div>
                                            </div>
                                            <table id="bootstrap-data-table"
                                                   class="table  table-hover table-text-center border">
                                                <thead class="thead-light">
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Mã khách hàng</th>
                                                    <th>Ngày lập</th>
                                                    <th>Chi tiết đơn hàng</th>

                                                </tr>
                                                </thead>
                                                <tbody id="content-table">

                                                <c:forEach items="${listBill}" var="x">
                                                <tr>
                                                    <td>${x.idBill}</td>
                                                    <td>${x.idUser}</td>
                                                    <td>${x.createdAt}</td>
                                                    <td class="detail"><a data-toggle="modal"
                                                                          data-target="#exampleModal" href='#'> Chi tiết
                                                        <i
                                                                class="fa fa-external-link-alt"></i></a>
                                                        <div class="modal fade" id="exampleModal" tabindex="-1"
                                                             aria-labelledby="exampleModalLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog  detail-modal">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title"
                                                                            id="exampleModalLabel">Chi tiết đơn
                                                                            hàng</h5>
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal"
                                                                                aria-label="Close">
                                                                                    <span
                                                                                            aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <h5>Đơn hàng: DH01</h5>
                                                                        <table width="100%"
                                                                               class="text-center  table content-detail  table-hover">
                                                                            <thead class="thead-light">
                                                                            <tr>
                                                                                <th>Mã khách hàng</th>
                                                                                <th>Tên khách hàng</th>
                                                                                <th><span
                                                                                        title="Số điện thoại">
                                                                                                    SDT</span></th>
                                                                                <th
                                                                                        style="min-width: 300px;">
                                                                                    Địa chỉ
                                                                                </th>
                                                                                <th> Tên sản phẩm &amp; số
                                                                                    lượng
                                                                                </th>
                                                                                <th>Giá</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tr>


                                                                                <td>KH01</td>
                                                                                <td>Trần Thanh Bảo</td>
                                                                                <td><span title="Số điện thoại">
                                                                                                09128374822</span></td>
                                                                                <td style="min-width: 300px;">
                                                                                    Khu phố 6, phường Linh
                                                                                    Trung, quận Thủ Đức,TP Hồ
                                                                                    Chí Minh
                                                                                </th>
                                                                                <td>
                                                                                    <p>Iphone 12 64GB <span
                                                                                            class="font-weight-bold">x</span>
                                                                                        2 </p>
                                                                                    <p>Iphone X 32GB <span
                                                                                            class="font-weight-bold">x</span>
                                                                                        2 </p>
                                                                                </td>
                                                                                <td>
                                                                                    <p>24,000,000</p>
                                                                                    <p>7,000,000
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button"
                                                                                class="btn btn-secondary"
                                                                                data-dismiss="modal">Đóng
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>

                                                </tr>
                                                </c:forEach>

<%--                                                <tr>--%>
<%--                                                    <td>TH02</td>--%>
<%--                                                    <td>KH01</td>--%>
<%--                                                    <td>10/10/2020</td>--%>
<%--                                                    <td class="detail"><a href='#'> Chi tiết <i--%>
<%--                                                            class="fa fa-external-link-alt"></i></a></td>--%>

<%--                                                </tr>--%>
<%--                                                <tr>--%>
<%--                                                    <td>TH03</td>--%>
<%--                                                    <td>KH03</td>--%>
<%--                                                    <td>10/10/2020</td>--%>
<%--                                                    <td class="detail"><a href='#'> Chi tiết <i--%>
<%--                                                            class="fa fa-external-link-alt"></i></a></td>--%>

<%--                                                </tr>--%>
<%--                                                <tr>--%>
<%--                                                    <td>TH04</td>--%>
<%--                                                    <td>KH04</td>--%>
<%--                                                    <td>10/10/2020</td>--%>
<%--                                                    <td class="detail"><a href='#'> Chi tiết <i--%>
<%--                                                            class="fa fa-external-link-alt"></i></a></td>--%>

<%--                                                </tr>--%>


                                            </table>

                                            <div class="page-navigation">
                                                <div class="beta">
                                                    <button onclick="previous_page()"> Trước</button>
                                                    <span id="page-number">

                                                        </span>
                                                    <button onclick="next_page()"> Sau</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div><!-- .animated -->
                    </div><!-- .content -->


                    <!-- Add -->
                    <div class="modal fade" id="add" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Thêm User</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Đóng
                                    </button>
                                    <button type="button" class="btn btn-primary">Lưu</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /#right-panel -->
            </div>
        </div>
        <!-- /#page-content-wrapper -->
    </div>

    <script src="<c:url value="/assets/js/js_admin/divide-page.js"/>"></script>
    <!-- Menu Toggle Script -->
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