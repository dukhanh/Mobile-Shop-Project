<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <title>Quên mật khẩu</title>
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
        <img src="../assets/images/lock-forgot-password.png" alt="">
        <h1 class="title">Nhập email đã đăng kí</h1>
        <c:if test="${errorMessage!=null}">
            <div class="alert alert-danger" role="alert">
                    ${errorMessage}
            </div>
        </c:if>
        <form action="${pageContext.request.contextPath}/send_code_forgot_pass" method="POST"
              onsubmit="return checkSendEmail()">
            <input type="email" id="email" name="email" class="field-email" placeholder="Nhập email"
                   onfocusout="checkEmail(this.id)" value="${email}" required>
            <div class="require" id="require-email" style="display: none">
                Yêu cầu nhập email theo đúng theo định dạng email
            </div>
            <button type="submit" class="submit-email">OK</button>
        </form>

    </div>
</div>
<!-- /.login-form -->
<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
</body>


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

</html>