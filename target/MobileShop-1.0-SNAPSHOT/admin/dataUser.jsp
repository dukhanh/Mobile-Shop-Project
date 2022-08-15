<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
    <jsp:include page="/admin/sub-component/header-admin.jsp"/>
    <style>
        .modal_user {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 2;
            overflow-y: auto;
        }

        .modal__overlay {
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal__body {
            width: 500px;
            margin: 50px auto;
            position: relative;
        }
    </style>
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
                                                    <th>Email</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Quyền hạn</th>
                                                    <th>Trạng thái</th>

                                                    <th></th>
                                                </tr>
                                                </thead>

                                                <tbody id="content-table">
                                                <c:forEach items="${listDataUser}" var="x" varStatus="loop">
                                                <tr>
                                                    <td>${x.id}</td>
                                                    <td>${x.fullName}</td>
                                                    <td>${x.email}</td>
                                                    <td>${x.phoneNumber}</td>
                                                    <td>${x.role}</td>
                                                    <td class="status__item">${x.status}</td>
                                                    <td class="row" style="border: none;">
                                                        <c:if test="${(x.role).equals('customer')}">
                                                            <div style="margin: auto;">
                                                                <button
                                                                        class="btn btn-success sizeTh1 btn__status"
                                                                        onclick="openDialogConfirm(${loop.index})"
                                                                        style="background-color:${(x.status).equals('open')?'#28a745':'#bd2130'}"
                                                                >
                                                                    <i class="txt-center fas fa-lock"></i>
                                                                </button>
                                                            </div>

                                                            <div class="modal_user" style="display: none">
                                                                <div class="modal__overlay">
                                                                </div>

                                                                <div class="modal__body">
                                                                    <div class="modal__inner">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title">
                                                                                    <c:if test="${(x.status).equals('open')}">
                                                                                        Xác nhận khóa tài khoản
                                                                                    </c:if>
                                                                                    <c:if test="${(x.status).equals('close')}">
                                                                                        Xác nhận mở tài khoản
                                                                                    </c:if>
                                                                                </h5>
                                                                                <button type="button" class="close"
                                                                                        onclick="closeDialog(${loop.index})"
                                                                                >
                                                                                    <i aria-hidden="true">&times;</i>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <c:if test="${(x.status).equals('open')}">
                                                                                    Bạn có muốn xác nhận khóa user này không?
                                                                                </c:if>
                                                                                <c:if test="${(x.status).equals('close')}">
                                                                                    Bạn có muốn xác nhận mở user này không?
                                                                                </c:if>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button"
                                                                                        class="btn btn-secondary"
                                                                                        onclick="closeDialog(${loop.index})"
                                                                                >Hủy
                                                                                </button>
                                                                                <form action="${pageContext.request.contextPath}/admin/dataUser" method="post">
                                                                                    <input type="hidden" name="status" value="${x.status}">
                                                                                    <input type="hidden" name="userId" value="${x.id}">
                                                                                    <button type="submit"
                                                                                            class="btn btn-primary"
                                                                                    >Xác nhận
                                                                                    </button>
                                                                                </form>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </c:if>

                                                    </td>
                                                </tr>
                                                </c:forEach>

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


    <script>
        function openDialogConfirm(indexModal) {
            $('.modal_user').eq(indexModal).css("display", "block");
        }

        function closeDialog(indexModal) {
            $('.modal_user').eq(indexModal).css("display", "none");
        }

    </script>
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