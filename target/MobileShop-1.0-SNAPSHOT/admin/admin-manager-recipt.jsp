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
            <div class="border mt-3">
                <h4 class="text-center mt-3 mb-4">Quản lí đơn hàng</h4>
                <div class="row">
                    <div class="show-page mb-3 ml-3">
                        Hiển thị <span> <select id="show" onclick="select_page()">
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
                    <tr>
                        <td>DH01</td>
                        <td>KH01</td>

                        <td>
                            20,200,000
                        </td>
                        <td>
                            20/11/2020
                        </td>

                        <td class="detail"><a data-toggle="modal" data-target="#exampleModal" href='#'> Chi tiết <i
                                class="fa fa-external-link-alt"></i></a>


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

                    </tbody>


                </table>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog  detail-modal">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Chi tiết đơn hàng</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h5>Đơn hàng: DH01</h5>
                                <table width="100%" class="text-center  table content-detail  table-hover">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>Mã khách hàng</th>
                                        <th>Tên khách hàng</th>
                                        <th><span title="Số điện thoại"> Số điện thoại</span></th>
                                        <th>Hình thức thanh toán</th>
                                        <th style="min-width: 300px;"> Địa chỉ</th>

                                    </tr>
                                    </thead>
                                    <tr>


                                        <td>KH01</td>
                                        <td>Nguyễn Văn A</td>
                                        <td><span title="Số điện thoại"> 09128374822</span></td>
                                        <td>Thanh toán khi nhận hàng</td>
                                        <td style="min-width: 300px;"> Khu phố 6, phường Linh Trung, quận Thủ Đức,TP Hồ
                                            Chí Minh
                                        </th>

                                    </tr>
                                </table>
                                <table width="100%" class="text-center  table content-detail  table-hover">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>Hình ảnh</th>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Màu sắc</th>
                                        <th>Số lượng</th>
                                        <th> Giá</th>

                                    </tr>
                                    </thead>
                                    <tr>
                                        <td style="max-width: 140px;"><img src="/assets/images/Product/i12black.png"
                                                                           width="100px"
                                                                           height="100px" alt=""></td>
                                        <td>SP01</td>
                                        <td>IPhone X 64GB</td>
                                        <td><span title="Số điện thoại"> Đen</span></td>
                                        <td style="min-width: 300px;">1
                                        </th>
                                        <td style="min-width: 300px;">17.000.000<span
                                                style="text-decoration: underline;">đ</span>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td style="max-width: 140px;"><img src="/assets/images/Product/samsung.png"
                                                                           width="100px"
                                                                           height="100px" alt=""></td>
                                        <td>SP02</td>
                                        <td>Samsung Galaxy S10</td>
                                        <td><span title="Số điện thoại">Trắng</span></td>
                                        <td style="min-width: 300px;">1
                                        </th>
                                        <td style="min-width: 300px;">23.000.000<span
                                                style="text-decoration: underline;">đ</span>
                                        </th>
                                    </tr>
                                </table>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
    <!-- /#page-content-wrapper -->
</div>
<!-- /#wrapper -->

<!-- Bootstrap core JavaScript -->
<!-- Menu Toggle Script -->
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