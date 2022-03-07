<%--<jsp:useBean id="address" scope="request" type="model.Address"/>--%>
<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/sub-component/taglib.jsp" %>
<head>
    <jsp:include page="/sub-component/header.jsp"/>
    <link href="<c:url value="/assets/css/address-deliver.css"/>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<c:url value="/assets/js/validate-form.js"/>"></script>
    <script src="<c:url value="/assets/js/vietnamlocalselector.js"/>"></script>
    <script src="<c:url value="/assets/js/js_pages/address.js"/>"></script>
    <script>
        const localpicker = new LocalPicker({
            province: "ls_province",
            district: "ls_district",
            ward: "ls_ward",
        });
    </script>
    <script>
        window.onload = function () {
            defaultProvince("${sessionScope.address.province}");
            defaultDistrict("${sessionScope.address.district}");
            defaultWard("${sessionScope.address.ward}");
        };
    </script>

</head>
<fmt:setLocale value="vi_VN"/>
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
                        <li>Địa chỉ</li>
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
                        <img src="${pageContext.request.contextPath}/assets/images/user-img.png" alt="">
                        <span>${sessionScope.account.fullName}</span>
                    </div>
                    <div class="side-bar-content">
                        <ul>
                            <a href="${pageContext.request.contextPath}/profile_update">
                                <li class="slide-bar "><i class="fa fa-edit"></i><span>Thông tin tài khoản</span></li>
                            </a>
                            <a href="${pageContext.request.contextPath}/bill_list">
                                <li class="slide-bar "><i class="fas fa-money-check"></i><span>Quản lý đơn hàng</span>
                                </li>
                            </a>
                            <a href="${pageContext.request.contextPath}/favorite_product">
                                <li class="slide-bar "><i class="far fa-heart"></i><span>Sản phẩm yêu thích</span>
                                </li>
                            </a>
                            <a href="${pageContext.request.contextPath}/update_address">
                                <li class="slide-bar active"><i
                                        class="fas fa-map-marker"></i><span> Địa chỉ giao hàng</span></li>
                            </a>
                            <a href="${pageContext.request.contextPath}/reset_password">
                                <li class="slide-bar"><i class="fas fa-lock"></i><span> Đổi mật khẩu</span></li>
                            </a>
                        </ul>
                    </div>
                </div>
                <div class="right-container">
                    <h3 class="title-content">Địa chỉ của tôi</h3>
                    <jsp:include page="/sub-component/address.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.login-form -->
<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
</body>
<script>
    $('#form-address').submit(function () {
        const form = $(this);
        const url = form.attr('action');
        const data = form.serialize();
        $.ajax({
            url: url,
            type: 'POST',
            data: data,
            success: function (data) {
                const s = document.getElementById('wrap-address');
                s.innerHTML = data;
                // s.show();
                $('#edit-address').hide();
            }
        });
        return false;
    });
</script>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

</html>