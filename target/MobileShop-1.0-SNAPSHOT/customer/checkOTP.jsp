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
        <img src="../assets/images/otp-icon.png" alt="">
        <h1 class="title">Nhập mã OTP</h1>
        <p>Mã OTP được gửi qua email</p>
        <form action="">
            <input type="email" class="field-email" placeholder="Nhập mã OTP">
            <button type="submit" class="submit-email mb20">Tiếp tục</button>
        </form>
        <a href="" class="text-blue">Gửi lại mã OTP</a>
    </div>
</div>
<!-- /.login-form -->
<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
</body>


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

</html>