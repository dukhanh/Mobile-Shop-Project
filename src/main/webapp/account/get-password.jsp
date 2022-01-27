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
                        <li>Quên mật khẩu</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- login-form -->

<div class="content">
    <div class="forgot-container">
        <img src="../assets/images/get-password-icon.png" alt="">
        <h1 class="title">Nhập mật khẩu mới</h1>
        <form action="${pageContext.request.contextPath}/new_password" method="post" onsubmit="return checkResetPassword()">
            <input type="hidden" name="email" value="${email}">
            <input id="password" type="password" name="password" class="field-email" placeholder="Nhập mật khẩu"
                   onfocusout="checkPassword(this.id)" required>
            <div class="require" id="require-password" style="display: none;">
                Mật khẩu phải có ít nhất 8 ký tự bao gồm chữ và số
            </div>
            <input id="re-password" type="password" name="re-password" class="field-email" style="margin-top: 15px"
                   placeholder="Nhập lại mật khẩu"
                   onfocusout="checkPasswordConfirm(this.id)" required>
            <div class="require" id="require-password-confirm"
                 style="display: none">
                Xác nhận mật khẩu không đúng
            </div>
            <div class="show-password" style="margin: 5px 0 0 0;">
                <input id="show-password" type="checkbox" style="height: 17px; width: 17px;" onclick="Toggle()">
                <label for="show-password">Hiển thị mật khẩu</label>
            </div>
            <button type="submit" class="submit-email mb20">Lưu mật khẩu</button>

        </form>

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
        if (pass.type === "password") {
            pass.type = "text";
            re_pass.type = "text";
        } else {
            pass.type = "password";
            re_pass.type = "password";
        }
    }
</script>

<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

</html>