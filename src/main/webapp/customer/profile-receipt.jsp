<%@ page import="service.BillService" %>
<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <title>Đơn hàng của tôi</title>
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
                        <li>Thông tin đơn hàng</li>
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
                        <span>${sessionScope.account.fullName}</span>
                    </div>
                    <div class="side-bar-content">
                        <ul>
                            <a href="${pageContext.request.contextPath}/profile_update">
                                <li class="slide-bar "><i class="fa fa-edit"></i><span>Thông tin tài khoản</span></li>
                            </a>
                            <a href="${pageContext.request.contextPath}/bill_list">
                                <li class="slide-bar active"><i
                                        class="fas fa-money-check"></i><span>Quản lý đơn hàng</span></li>
                            </a>
                            <a href="${pageContext.request.contextPath}/favorite_product">
                                <li class="slide-bar"><i class="far fa-heart"></i><span>Sản phẩm yêu thích</span></li>
                            </a>
                            <a href="${pageContext.request.contextPath}/update_address">
                                <li class="slide-bar"><i class="fas fa-map-marker"></i><span> Địa chỉ giao hàng</span>
                                </li>
                            </a>
                            <!-- <a href="address-deliver.html"><li class="slide-bar"><i class="fas fa-map-marker-alt"></i><span> Địa chỉ nhận hàng</span></li></a> -->
                            <a href="${pageContext.request.contextPath}/reset_password">
                                <li class="slide-bar"><i class="fas fa-lock"></i><span> Đổi mật khẩu</span></li>
                            </a>
                        </ul>
                    </div>
                </div>
                <div class="right-container">
                    <h3 class="title-content">Đơn hàng đã đặt</h3>
                    <div class="receipt-infor">

                        <c:choose>
                            <c:when test="${fn:length(bills)>0}">
                                <table class="table table-hover">
                                    <thead class="thead-light">
                                    <tr>
                                        <th scope="col">Mã đơn hàng</th>
                                        <th scope="col">Tên khách hàng</th>
                                        <th scope="col">Ngày đặt hàng</th>
                                        <th scope="col">Tình trạng đơn hàng</th>
                                        <th scope="col">Chi tiết đơn hàng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${bills}" var="bill">
                                        <tr>
                                            <th scope="row">${bill.idBill}</th>
                                            <td>${sessionScope.account.fullName}</td>
                                            <td>${bill.createdAt}</td>
                                            <td>${bill.status}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/bill_detail?billId=${bill.idBill}">Xem
                                                    chi tiết</a></td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <div class="null-receipt">
                                    <i class="fas fa-receipt"></i>
                                    <p>Bạn chưa có đơn hàng nào</p>
                                </div>
                            </c:otherwise>
                        </c:choose>

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