<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="vi_VN"/>
<head>
    <jsp:include page="/admin/sub-component/header-admin.jsp"/>
    <style>
        .modal_receipt {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 2;
            overflow-y: auto;
            /* height: 100%; */
        }

        .modal__overlay {
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            /* z-index: 3; */
        }

        .modal__body {
            width: 90%;
            /* height: 382px; */
            margin: 50px auto;
            position: relative;
        }

        .product__row td {
            vertical-align: middle;
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
            <div class="border mt-3">
                <h4 class="text-center mt-3 mb-4">Quản lí đơn hàng</h4>
                <div class="row">
                    <div class="show-page mb-3 ml-3">
                        Hiển thị <span> <select id="show-row" onclick="select_page()">
                  <option value="10">
                    10 dòng
                  </option>
                  <option value="20">
                    20 dòng
                  </option>
                  <option value="50">
                    50 dòng
                  </option>
                </select></span>
                    </div>
                    <div class="show-page arrange">
                        <input id="myInput" type="text" class="input-form" placeholder="Tìm kiếm">
                    </div>
                </div>
                <table class="table table-hover table-text-center" id="receipt-table">
                    <thead class="thead-light">
                    <tr>
                        <th scope="col">Mã đơn hàng</th>
                        <th scope="col">Mã khách hàng</th>

                        <th scope="col">Tổng giá trị</th>
                        <th scope="col">Ngày lập</th>

                        <th scope="col">Chi tiết đơn hàng</th>
                        <th scope="col">Xác nhận đơn hàng</th>

                    </tr>
                    </thead>
                    <tbody id="content-table">
                    <c:forEach items="${listBill}" var="x">
                        <tr>
                            <td>${x.idBill}</td>
                            <td>${x.idUser}</td>
                            <td>
                                <fmt:formatNumber value="${x.total}"/> vnđ
                            </td>
                            <td>${x.createdAt}</td>

                            <td class="detail">
                                <button
                                        class="text-primary bg-transparent border-0"
                                        onclick="showDetailReceipt('${x.idBill}')"
                                >
                                    Chi tiết <i class="fa fa-external-link-alt"></i>
                                </button>
                                <!-- Modal -->
                            </td>
                            <td class="confirm">
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-check" name="confirm-check">
                    <label title="Xác nhận đơn hàng" class="label-check active" data-toggle="modal"><i
                            class="fas fa-check-square"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận đơn hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                                <span>
                    <input class="confirm-check" type="checkbox" value="confirm-delivered" name="confirm-deliverd">
                    <label title="Xác nhận vận chuyển thành công" class="label-delivered disable"><i
                            class="fas fa-truck"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận vận chuyển</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận vận chuyển thành công?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>
                                <span>
                    <input class="confirm-check" type="checkbox" value="confirm-cancel" name="confirm-cancel">
                    <label title="Hủy đơn hàng" data-toggle="modal" class="label-cancel warning"><i
                            class="fas fa-trash"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận hủy đơn</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận hủy đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="modal_receipt" id="modal_receipt" style="display: none">
                    <div class="modal__overlay">
                    </div>

                    <div class="modal__body">
                        <div class="modal__inner" id="modal__inner">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Chi tiết đơn hàng</h5>
                                    <button type="button"
                                            class="close"
                                            onclick="closeDetailReceipt()"
                                    >
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" id="modal__body">

                                </div>
                                <div class="modal-footer">
                                    <button type="button"
                                            class="btn btn-secondary"
                                            onclick="closeDetailReceipt()"
                                    >
                                        Đóng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>


            <div class="page-navigation">
                <div class="beta">
                    <button onclick="previous_page()"> Trước</button>
                    <span id="page-number"></span>
                    <button onclick="next_page()"> Sau</button>
                </div>
            </div>


        </div>
    </div>
    <!-- /#page-content-wrapper -->
</div>
<!-- /#wrapper -->

<!-- Bootstrap core JavaScript -->
<!-- Menu Toggle Script -->
<script>
    function showDetailReceipt(id) {
        $("#modal_receipt").css("display", "block");
        $.ajax({
            url: '/admin/show_receipt',
            type: 'GET',
            data: {
                'receiptId': id,
            },
            success: function (data) {
                const body = $("#modal__body");
                body.empty();
                body.append(data)
            },

        });
    }

    function closeDetailReceipt() {
        $("#modal_receipt").css("display", "none");
    }

</script>
<script>
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
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
<script src="<c:url value="/assets/js/js_admin/divide-page.js"/>"></script>
<script src="<c:url value="/assets/js/js_admin/confirmed.js"/>"></script>
</body>

</html>