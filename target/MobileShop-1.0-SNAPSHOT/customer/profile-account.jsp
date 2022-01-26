<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
    <jsp:include page="/sub-component/header.jsp"/>
</head>
<c:if test="${not empty message}">
    <script>
        window.addEventListener("load",function(){
            alert("${message}");
        })
    </script>
</c:if>
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
                        <span>${sessionScope.account.fullName}</span>
                    </div>
                    <div class="side-bar-content">
                        <ul>
                            <a href="">
                                <li class="slide-bar active"><i class="fa fa-edit"></i><span>Thông tin tài khoản</span>
                                </li>
                            </a>
                            <a href="profile-receipt.jsp">
                                <li class="slide-bar"><i class="fas fa-money-check"></i><span>Quản lý đơn hàng</span>
                                </li>
                            </a>
                            <!-- <a href="address-deliver.html"><li class="slide-bar"><i class="fas fa-map-marker-alt"></i><span> Địa chỉ nhận hàng</span></li></a> -->
                            <a href="profile-reset-password.jsp">
                                <li class="slide-bar"><i class="fas fa-lock"></i><span> Đổi mật khẩu</span></li>
                            </a>
                        </ul>
                    </div>
                </div>
                <div class="right-container">
                    <h3 class="title-content">Thông tin tài khoản</h3>
                    <div class="account-infor">


                        <form action="${pageContext.request.contextPath}/profile_update" method="post" accept-charset="utf-8">

                            <div class="form-control">
                                <label for="email" class="input-label">
                                    Email
                                </label>
                                <input id="email" type="email" name="email" class="input-field"
                                       value="${sessionScope.account.email}" readonly="readonly">
                            </div>
                            <div>
                                <div class="form-control">
                                    <label for="name" class="input-label">
                                        Họ & tên
                                    </label>
                                    <input id="name" type="text" name="name" placeholder="Thêm họ tên"
                                           class="input-field"
                                           value="${sessionScope.account.fullName}" onfocusout="checkName(this.id)">
                                </div>
                                <div class="require" id="require-name" style="display: none;margin-left:160px;">
                                    Tên không chứa ký tự đặc biệt hoặc số
                                </div>
                                <div class="require" id="require-name-length" style="display: none;margin-left:160px;">
                                    Tên phải có ít nhất 5 ký tự
                                </div>
                            </div>
                            <div>
                                <div class="form-control">
                                    <label for="phone" class="input-label">
                                        Số điện thoại
                                    </label>
                                    <input id="phone" type="text" name="phone" placeholder="Thêm số điện thoại"
                                           class="input-field" maxlength="10"
                                           value="${sessionScope.account.phoneNumber}" onfocusout="checkPhoneNumber(this.id)">
                                </div>
                                <div class="require" id="require-phone" style="display: none;margin-left:160px;">
                                    Số điện thoại không hợp lệ
                                </div>
                            </div>

                            <div class="form-control">
                                <label for="address" class="input-label">
                                    Địa chỉ giao hàng
                                </label>
                                <input id="address" name="address" type="text" placeholder="Địa chỉ" class="input-field"
                                       value="${sessionScope.account.address}">
                            </div>
                            <%--                            <div class="form-control">--%>
                            <%--                                <label for="birth-date" class="input-label">--%>
                            <%--                                    Ngày sinh--%>
                            <%--                                </label>--%>
                            <%--                                <input id="birth-date" name="birth-date" type="date" placeholder="Thêm ngày sinh" class="input-field">--%>
                            <%--                            </div>--%>
                            <%--                            <div class="form-control">--%>
                            <%--                                <label for="" class="input-label">--%>
                            <%--                                    Giới tính--%>
                            <%--                                </label>--%>
                            <%--                                <input type="radio" name="gender" value="male" checked class="input-radio"> Nam--%>
                            <%--                                <input type="radio" name="gender" value="female" class="input-radio"> Nữ--%>
                            <%--                                <input type="radio" name="gender" value="other" class="input-radio"> Khác--%>

                            <%--                            </div>--%>

                            <button class="btn-update" type="submit">Cập nhật</button>
                        </form>
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