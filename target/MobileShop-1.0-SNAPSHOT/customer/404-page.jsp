<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/404-page.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

<head>
    <jsp:include page="../sub-component/header.jsp"/>
    <title>Error page</title>
</head>

<body>
<!-- top-header-->
<jsp:include page="../sub-component/header-menu.jsp"/>
<!-- page-header -->
<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li><a href="#">trang chủ</a></li>
                        <li>Lỗi 404</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.page-header-->
<!-- 404 error -->
<%--    <div class="space-medium">--%>
<div class="container">
    <div class="error-wrapper">
        <div class="row">
            <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                <h1 style="font-size: 100px;margin-bottom: 40px;">404</h1>
                <h2>Xin lỗi, trang bạn đang tìm kiếm không tồn tại!</h2>
                <h4>Trang bạn tìm kiếm không tồn tại. Có thể là bạn đã nhầm lẫn hoặc chúng tôi đã chuyển hướng.</h4>
                <div class="row">
                    <%--                            <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12 mb30 ">--%>
                    <%--                                <div class="search-bg">--%>
                    <%--                                    <input type="text" class="form-control" placeholder="Tìm kiêm ở đây">--%>
                    <%--                                    <button type="Submit"><i class="fa fa-search"></i></button>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                </div>
                <%--                        <h5>Hoặc</h5>--%>
                <a href="/" class="btn btn-primary btn-lg">Quay về trang chủ</a>
            </div>
        </div>
    </div>
</div>
<%--    </div>--%>
<!-- 404 error -->
<!-- footer -->
<jsp:include page="../sub-component/footer.jsp"/>

</body>


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:40 GMT -->

</html>