<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>
</head>

<body>
<!-- top-header-->
<jsp:include page="/sub-component/header-menu.jsp"/>
    <!-- /. header-section-->
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-breadcrumb">
                        <ol class="breadcrumb">
                            <li><a href="#">Trang chủ</a></li>
                            <li>Thông tin tài khoản</li>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- login-form -->

    <div class="content">
        <div class="container">
            <div class="box">
                <div class="row-account">
                    <div class="left-container">
                        <div class="user-infor">
                            <img src="../assets/images/user-img.png" alt="">
                            <span>NGUYEN DU KHANH</span>
                        </div>
                        <div class="side-bar-content">
                            <ul>
                                <a href="profile-account.jsp">
                                    <li class="slide-bar "><i class="fa fa-edit"></i><span>Thông tin tài khoản</span>
                                    </li>
                                </a>
                                <a href="profile-receipt.jsp">
                                    <li class="slide-bar active"><i class="fas fa-money-check"></i><span>Quản lý đơn
                                            hàng</span></li>
                                </a>
                                <!-- <a href="address-deliver.html"><li class="slide-bar"><i class="fas fa-map-marker-alt"></i><span> Địa chỉ nhận hàng</span></li></a> -->
                                <a href="profile-reset-password.jsp">
                                    <li class="slide-bar"><i class="fas fa-lock"></i><span> Đổi mật khẩu</span></li>
                                </a>
                            </ul>
                        </div>
                    </div>
                    <div class="right-container">
                        <h3 class="title-content">Đơn hàng đã đặt/ Chi tiết đơn hàng</h3>
                        <div class="receipt-infor-details">
                            <div class="title-receipt">
                                <div class="left-content content">
                                    <h4>ĐƠN HÀNG</h4>
                                    <p class="receipt-id">Mã đơn hàng: DH01</p>
                                    <p class="receipt-time">Đặt hàng: 10/10/2021</p>
                                </div>
                                <p></p>
                                <div class="right-content content">
                                    <h4>THÔNG TIN NHẬN HÀNG</h4>
                                    <p><strong>NGUYỄN DU KHÁNH</strong> - 0364413771</p>
                                    <p class="address">số nhà 82, đường 30, khu phố 6 - Phường Bình Chiểu - Thành phố
                                        Thủ Đức - Hồ Chí Minh</p>
                                </div>
                            </div>
                            <table class="table">
                                <thead class="thead-light">
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th scope="col">Đơn giá</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="product-title">
                                                <img src="../assets/images/iPhone_13.jpg" alt="">
                                                <div>
                                                    <p>iPhone 13 Pro 128GB</p>
                                                    <p>Màu sắc: Đỏ</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td><div class="item-center">30.750.000đ</div></td>
                                        <td><div class="item-center">1</div></td>
                                        <td><div class="item-center">30.750.000đ</div></td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="product-title">
                                                <img src="../assets/images/iphone11.png" alt="">
                                                <div>
                                                    <p>iPhone 11 Pro 128GB</p>
                                                    <p>Màu sắc: Xanh</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td><div class="item-center">17.000.000đ</div></td>
                                        <td><div class="item-center">1</div></td>
                                        <td><div class="item-center">17.000.000đ</div></td>
                                    </tr>

                                </tbody>

                                <tfoot>
                                    <tr>
                                        <td scope="row"></td>
                                        <td></td>
                                        <td scope="row">
                                            <div>
                                                <p>Tổng tiền:</p>
                                                <p>Phí vận chuyển:</p>
                                                <p>Tổng thanh toán:</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <p>47.750.000đ</p>
                                                <p>50.000đ</p>
                                                <p>47.800.000đ</p>
                                            </div>
                                        </td>
                                    </tr>

                                </tfoot>
                            </table>
                            <a href="../customer/profile-receipt.jsp" class="redirect-to-receipt text-blue"><i class="fas fa-long-arrow-alt-left"></i> Danh sách đơn hàng</a>
                        </div>
                    </div>
                    <!-- /.features -->
                </div>
            </div>
        </div>
    </div>
    <!-- /.login-form -->
    <!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
</body>


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

</html>