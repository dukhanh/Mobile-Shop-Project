<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 1/24/2022
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>
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
                <div class="col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12 ">
                    <!-- form -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 mb20">
                                <h1 class="mb10" style="text-align: center">Tạo tài khoản</h1>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <c:if test="${errorMessage!=null}">
                                    <div class="alert alert-danger" role="alert">
                                            ${errorMessage}
                                    </div>
                                </c:if>
                            </div>
                            <form action="${pageContext.request.contextPath}/send_code_register" method="post" onsubmit="return checkSendEmail()">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label" for="email">Địa chỉ email*</label>
                                        <input id="email" name="email" type="email" class="form-control"
                                               placeholder="Vui lòng nhập email" onfocusout="checkEmail(this.id)" required value="${email}">
                                    </div>
                                    <div class="require" id="require-email" style="display: none">
                                        Yêu cầu nhập email theo đúng theo định dạng email
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <input class="btn btn-primary btn-block mb20 mt10" type="submit" value="Lấy mã xác nhận">
                                    <div>
                                        <p>Bạn đã có tài khoản?<a href="../account/login-form.jsp"> Đăng Nhập</a></p>
                                    </div>
                                </div>
                            </form>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt30">
                                <div class="social-media">
                                    <a href="#" class="btn-social-rectangle btn-facebook"><i
                                            class="fa fa-facebook"></i><span class="social-text">Facebook</span></a>

                                    <a href="#" class="btn-social-rectangle btn-googleplus"><i
                                            class="fa fa-google-plus"></i><span class="social-text">Google
                                                Plus</span></a>
                                </div>
                            </div>
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

</html>
