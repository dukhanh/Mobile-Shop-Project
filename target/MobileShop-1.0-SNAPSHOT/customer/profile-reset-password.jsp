<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>
    <script type="text/javascript" src="<c:url value="/assets/js/validate-form.js"/>"></script>

</head>
<c:if test="${not empty messageSuccess}">
    <script>
        window.addEventListener("load", function () {
            alert("${messageSuccess}");
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
                            <a href="${pageContext.request.contextPath}/customer/profile-account.jsp">
                                <li class="slide-bar"><i class="fa fa-edit"></i><span>Thông tin tài khoản</span>
                                </li>
                            </a>
                            <a href="${pageContext.request.contextPath}/customer/profile-receipt.jsp">
                                <li class="slide-bar"><i class="fas fa-money-check"></i><span>Quản lý đơn
                                            hàng</span></li>
                            </a>
                            <!-- <a href="address-deliver.html">
                                <li class="slide-bar"><i class="fas fa-map-marker-alt"></i><span> Địa chỉ nhận
                                        hàng</span></li>
                            </a> -->
                            <a href="${pageContext.request.contextPath}/customer/profile-reset-password.jsp">
                                <li class="slide-bar active"><i class="fas fa-lock"></i><span> Đổi mật khẩu</span>
                                </li>
                            </a>
                        </ul>
                    </div>
                </div>
                <div class="right-container">
                    <h3 class="title-content">Đổi mật khẩu</h3>

                    <div class="reset-password-content">

                        <form action="${pageContext.request.contextPath}/reset_password" method="post"
                              onsubmit="return checkResetPassword()">
                            <div style="margin-bottom: 5px; width: 500px; margin-left: 15px;">
                                <c:if test="${message!=null}">
                                    <div class="alert alert-danger" role="alert" style="margin-bottom:0">
                                            ${message}
                                    </div>
                                </c:if>
                            </div>
                            <div class="form-control">
                                <label for="password-current" class="input-label">Mật khẩu hiện tại</label>
                                <input id="password-current" name="current-password" type="password" class="input-field"
                                       required>
                            </div>
                            <div class="form-control">
                                <label for="password" class="input-label">Mật khẩu mới</label>
                                <input id="password" name="new-password" type="password" class="input-field"
                                       onfocusout="checkPassword(this.id)" required>
                            </div>
                            <div class="require" id="require-password" style="display: none; margin-left: 165px;">
                                Mật khẩu phải có ít nhất 8 ký tự bao gồm chữ và số
                            </div>
                            <div class="form-control">
                                <label for="re-password" class="input-label">Nhập lại mật khẩu</label>
                                <input id="re-password" name="re-password" type="password" class="input-field"
                                       onfocusout="checkPasswordConfirm(this.id)" required>
                            </div>
                            <div class="require" id="require-password-confirm"
                                 style="display: none; margin-left: 165px;">
                                Xác nhận mật khẩu không đúng
                            </div>
                            <div class="show-password">
                                <input id="show-password" type="checkbox" onclick="Toggle()">
                                <label for="show-password">Hiển thị mật khẩu</label>
                            </div>

                            <button class="btn-update-password" type="submit">Đổi mật khẩu</button>
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

<script>
    // Change the type of input to password or text
    function Toggle() {
        const pass = document.getElementById("password");
        let re_pass = document.getElementById("re-password");
        const current_pass = document.getElementById("password-current");
        if (pass.type === "password") {
            pass.type = "text";
            re_pass.type = "text";
            current_pass.type = "text";
        } else {
            pass.type = "password";
            re_pass.type = "password";
            current_pass.type = "password";
        }
    }
</script>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

</html>