<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>
</head>
<c:if test="${not empty successNewPass}">
    <script>
        window.addEventListener("load", function () {
            alert("${successNewPass}");
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
                        <li><a href="">Trang chủ</a></li>
                        <li>Đăng nhập</li>
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
            <div class="row">
                <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12 ">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 mb20">
                                <h1 class="mb10" style="text-align:center">Đăng nhập</h1>
                            </div>
                            <!-- form -->
                            <form action="${pageContext.request.contextPath}/login" method="post">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <c:if test="${errorMessage!=null}">
                                        <div class="alert alert-danger" role="alert">
                                                ${errorMessage}
                                        </div>
                                    </c:if>

                                    <div class="form-group">
                                        <div class="login-input">
                                            <input id="email" name="email" type="text" class="form-control"
                                                   style="margin-bottom: 15px;"
                                                   placeholder="Địa chỉ email" value="${email}" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">

                                        <div class="login-input">
                                            <input id="password" name="password" type="password" class="form-control"
                                                   style="margin-bottom: 15px;"
                                                   placeholder="Mật khẩu" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="show-password" style="margin-left: 0;">
                                        <input id="show-password" type="checkbox" onclick="Toggle()">
                                        <label for="show-password">Hiển thị mật khẩu</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb20 ">
                                    <button class="btn btn-primary btn-block mb10" type="submit">Đăng nhập</button>
                                    <div style="margin: 0 auto; width: 50%">
                                        <a href="signup-form.jsp" style="margin-right: 40px;" class="text-blue">Đăng
                                            ký</a>
                                        <a href="forgot-password.jsp" class="text-blue">Quên mật khẩu </a>
                                    </div>
                                </div>
                            </form>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                <h4 class="mb20">Hoặc đăng nhập với</h4>
                                <div class="social-media">
                                    <a href="#" class="btn-social-rectangle btn-facebook"><i
                                            class="fa fa-facebook"></i><span class="social-text">Facebook</span></a>

                                    <a href="#" class="btn-social-rectangle btn-googleplus"><i
                                            class="fa fa-google-plus"></i><span class="social-text">Google
                                                Plus</span></a>
                                </div>
                            </div>
                            <!-- /.form -->
                        </div>
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
                                <p>Được đánh giá an toàn, tin cậy hàng đầu Việt Nam với nhiều chính sách hỗ trợ chăm sóc
                                    khách hàng.</p>
                            </div>
                        </div>
                        <div class="feature-left">
                            <div class="feature-icon">
                                <img src="../assets/images/feature_icon_2.png" alt="">
                            </div>
                            <div class="feature-content">
                                <h4>Thanh toán tức thì!</h4>
                                <p>Thanh toán mọi nơi mọi lúc, giao dịch nhanh gọn, bảo đảm, an toàn, với liên kết 90%
                                    ngân hàng, ví tiền, VISA trong toàn quốc!
                                </p>
                            </div>
                        </div>
                        <div class="feature-left">
                            <div class="feature-icon">
                                <img src="../assets/images/feature_icon_3.png" alt="">
                            </div>
                            <div class="feature-content">
                                <h4>Ưu đãi hấp dẫn!</h4>
                                <p>Với mong muốn làm hài lòng khách hàng, Mobistore luôn mang đến những ưu đãi cực kỳ
                                    tốt với chất lượng cao
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
<!-- /.login-form -->
<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
</body>
<script>
    // Change the type of input to password or text
    function Toggle() {
        const pass = document.getElementById("password");
        if (pass.type === "password") {
            pass.type = "text";
        } else {
            pass.type = "password";
        }
    }
</script>

<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

</html>