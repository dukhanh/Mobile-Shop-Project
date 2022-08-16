<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
    <jsp:include page="/admin/sub-component/header-admin.jsp"/>
    <title></title>
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
                                            <h4 class="text-center mt-3 mb-4">Phản hồi của khách hàng</h4>
                                            <div class="row">
                                                <div class="show-page mb-3 ml-3">

                                                    <span>Hiển thị</span>
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

                                            <table id="bootstrap-data-table" class="table table-hover text-left border">
                                                <thead class="thead-light">
                                                <tr>
                                                    <th>Họ tên</th>
                                                    <th>Email</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Thời gian</th>
                                                    <th>Lời nhắn</th>
                                                    <th></th>
                                                </tr>
                                                </thead>

                                                <tbody id="content-table">
                                                <c:forEach items="${listFeedbacks}" var="x" >
                                                <tr>
                                                    <td>${x.name}</td>
                                                    <td>${x.email}</td>
                                                    <td>${x.phone}</td>
                                                    <td>${x.title}</td>
                                                    <td class="feedback">${x.description}</td>
                                                    <td class="row" style="border: none;">
                                                        <div style="margin: auto;">
                                                            <button type="button" class="btn btn-primary"
                                                                    data-toggle="modal"
                                                                    data-target="#exampleModal" data-whatever="@mdo"><i
                                                                    class="text-center fas fa-paper-plane"></i></button>

                                                            <button class="btn btn-danger sizeTh1" data-toggle="modal"
                                                                    data-target="#delete"
                                                                    data-toggle="tooltip" data-placement="top"
                                                                    title="Xóa">
                                                                <i class="txt-center menu-icon fas fa-trash-alt"></i>
                                                            </button>
                                                        </div>

                                                    </td>
                                                </tr>
                                                </c:forEach>
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
    <!-- feedback -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Phản hồi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <%--@declare id="recipient-name"--%><label for="recipient-name" class="col-form-label">Gửi
                            tới: <b></b></label>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Phản hồi:</label>
                            <textarea class="form-control" rows="10" id="message-text"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Gửi phản hồi</button>
                </div>
            </div>
        </div>
    </div>


    <!-- delete product -->
    <!-- Modal -->
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Xác nhận xóa phản hồi của khách hàng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Bạn có muốn xóa phản hồi này.
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