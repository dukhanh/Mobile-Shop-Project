<!DOCTYPE html>
<html lang="en">


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <title>Liên hệ</title>
    <jsp:include page="/sub-component/header.jsp"/>
</head>

<body>
<!-- top-header-->
<jsp:include page="/sub-component/header-menu.jsp"/>
<!-- /. header-section-->
<!-- contact-form -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="box">
                    <div class="box-head">
                        <h2 class="head-title">Liên hệ với chúng tôi</h2>
                    </div>
                    <div class="box-body contact-form">
                        <div class="row">
                            <form method="post" action="${pageContext.request.contextPath}/report">
                                <c:if test="${sessionScope.account==null}">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="name"></label>
                                            <input id="name" name="name" type="text" placeholder="Họ và tên" class="form-control"
                                                   required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="phone"></label>
                                            <input id="phone" name="phone" type="tel" pattern="(0[3|5|7|8|9])+([0-9]{8})\b" placeholder="Điền số điện thoại"
                                                   class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="email"></label>
                                            <input id="email" name="email" type="email" placeholder="Điền địa chỉ email"
                                                   class="form-control" required>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label sr-only" for="name"></label>
                                        <input name="title" id="subject" type="text" placeholder="Vấn đề của bạn"
                                               class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label sr-only" for="textarea"></label>
                                        <textarea name="description"  class="form-control" id="textarea" name="textarea" rows="4"
                                                  placeholder="Chi tiết" ></textarea>
                                    </div>
                                    <button type="submit" name="singlebutton"
                                            class="btn btn-primary" required>Gửi</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.contact-form -->
            <!-- address-block -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="box">
                    <div class="box-head">
                        <h2 class="head-title">Thông tin liên hệ</h2>
                    </div>
                    <div class="box-body">
                        <div class="contact-block">
                            <h4>Địa chỉ</h4>
                            <p>Phường Linh Trung, Thủ ĐứcThành phố Hồ Chí Minh, Việt Nam - 1955</p>
                        </div>
                        <div class="contact-block">
                            <h4>Đường dây nóng</h4>
                            <p class="mb0">Phone: <span class="text-default">084-123-4567 / 98</span></p>
                            <p class="mb0">Email: <span class="text-default">nhom21@ltweb.com</span></p>
                        </div>
                        <div class="contact-block">
                            <h4>Liên kết</h4>
                            <div class="ft-social">
                                <span><a href="#" class="btn-social btn-facebook" ><i class="fa fa-facebook"></i></a></span>
                                <span><a href="#" class="btn-social btn-twitter"><i class="fa fa-twitter"></i></a></span>
                                <span><a href="#" class="btn-social btn-googleplus"><i class="fa fa-google-plus"></i></a></span>
                                <span><a href="#" class=" btn-social btn-linkedin"><i class="fa fa-linkedin"></i></a></span>
                                <span><a href="#" class=" btn-social btn-pinterest"><i class="fa fa-pinterest-p"></i></a></span>
                                <span><a href="#" class=" btn-social btn-instagram"><i class="fa fa-instagram"></i></a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.address-block -->
        </div>
    </div>
</div>
<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
</body>


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/contact-us.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:17 GMT -->

</html>