<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <title>Đăng ký</title>
    <jsp:include page="/sub-component/header.jsp"/>
    <script type="text/javascript" src="<c:url value="/assets/js/validate-form.js"/>"></script>
</head>

<body>
<!-- top-header-->
<jsp:include page="/sub-component/header-menu.jsp"/>

<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <div class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li><a href="#">Trang chủ</a></li>
                        <li>Đăng ký</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="content">
    <div class="container">
        <div class="box sing-form">
            <div class="row">
                <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12 ">
                    <!-- form -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 mb20">
                                <h1 class="mb10" style="text-align: center">Tạo tài khoản</h1>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <c:if test="${errorMessage!=null}">
                                    <div class="alert alert-danger" role="alert" style="margin-bottom:0">
                                            ${errorMessage}
                                    </div>
                                </c:if>
                            </div>

                            <form action="${pageContext.request.contextPath}/create_account" method="post" onsubmit="return checkRegister()" accept-charset="utf-8">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label" for="email">Địa chỉ email*</label>
                                        <input id="email" name="email" type="email" class="form-control"
                                               value="${sessionScope.emailRegister}" disabled>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label" for="code">Email Verification Code*</label>
                                        <input id="code" name="code" type="text" class="form-control"
                                               placeholder="6 chữ số" maxlength="6" onfocusout="checkCode(this.id)" required>
                                    </div>
                                    <div class="require" id="require-code" style="display: none">
                                        Mã phải là các chữ số
                                    </div>
                                    <div class="require" id="require-code-length" style="display: none">
                                        Mã phải có 6 chữ số
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label" for="name">Họ tên*</label>
                                        <input id="name" name="name" type="text" class="form-control"
                                               placeholder="Họ và tên" onfocusout="checkName(this.id)" required>
                                    </div>
                                    <div class="require" id="require-name" style="display: none">
                                         Tên không chứa ký tự đặc biệt hoặc số
                                    </div>
                                    <div class="require" id="require-name-length" style="display: none">
                                         Tên phải có ít nhất 5 ký tự
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label" for="password">Mật khẩu*</label>
                                        <input id="password" name="password" type="password" class="form-control"
                                               placeholder="Tối thiểu 8 ký tự bao gồm chữ và số" onfocusout="checkPassword(this.id)" required>
                                    </div>
                                    <div class="require" id="require-password" style="display: none">
                                        Mật khẩu phải có ít nhất 8 ký tự bao gồm chữ và số
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label" for="re-password">Xác nhận mật khẩu*</label>
                                        <input id="re-password" name="re_password" type="password" class="form-control"
                                               placeholder="Xác nhận mật khẩu" onfocusout="checkPasswordConfirm(this.id)" required>
                                    </div>
                                    <div class="require" id="require-password-confirm" style="display: none">
                                        Xác nhận mật khẩu không đúng
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="show-password" style="margin: 0;">
                                        <input id="show-password" type="checkbox" onclick="Toggle()">
                                        <label for="show-password">Hiển thị mật khẩu</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <input class="btn btn-primary btn-block mb10 mt10" type="submit" value="Đăng Ký">
                                    <div style="display: flex;justify-content: space-between">
                                        <p>Bạn đã có tài khoản?<a
                                                href="${pageContext.request.contextPath}/login"
                                                class="text-blue"> Đăng Nhập</a></p>
                                        <a href="account/send-code-register.jsp"
                                           class="text-blue">Gửi lại mã</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.form -->
                    </div>
                </div>
                <!-- features -->
                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
                    <div class="box-body">
                        <div class="feature-left">
                            <div class="feature-icon">
                                <img src="../assets/images/feature_icon_1.png" alt="">
                            </div>
                            <div class="feature-content">
                                <h4>Mức độ uy tín!</h4>
                                <p>Được đánh giá an toàn, tin cậy hàng đầu Việt Nam với nhiều chính sách hỗ trợ chăm
                                    sóc khách hàng.</p>
                            </div>
                        </div>
                        <div class="feature-left">
                            <div class="feature-icon">
                                <img src="../assets/images/feature_icon_2.png" alt="">
                            </div>
                            <div class="feature-content">
                                <h4>Thanh toán tức thì!</h4>
                                <p>Thanh toán mọi nơi mọi lúc, giao dịch nhanh gọn, bảo đảm, an toàn, với liên kết
                                    90% ngân hàng, ví tiền, VISA trong toàn quốc!
                                </p>
                            </div>
                        </div>
                        <div class="feature-left">
                            <div class="feature-icon">
                                <img src="../assets/images/feature_icon_3.png" alt="">
                            </div>
                            <div class="feature-content">
                                <h4>Ưu đãi hấp dẫn!</h4>
                                <p>Với mong muốn làm hài lòng khách hàng, Mobistore luôn mang đến những ưu đãi cực
                                    kỳ tốt với chất lượng cao
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.features -->
            </div>
        </div>
    </div>
</div>
<!-- /.sign-up form -->
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
            re_pass.type="text";
        } else {
            pass.type = "password";
            re_pass.type="password";
        }
    }
</script>
</html>