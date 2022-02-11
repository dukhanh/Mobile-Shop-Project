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
            defaultProvince("${address.province}");
            defaultDistrict("${address.district}");
            defaultWard("${address.ward}");
        };
    </script>
    <c:if test="${not empty message}">
        <script>
            window.addEventListener("load", function () {
                alert("${message}");
            })
        </script>
    </c:if>

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
                            <a href="${pageContext.request.contextPath}/customer/profile-account.jsp">
                                <li class="slide-bar "><i class="fa fa-edit"></i><span>Thông tin tài khoản</span></li>
                            </a>
                            <a href="${pageContext.request.contextPath}/customer/profile-receipt.jsp">
                                <li class="slide-bar "><i class="fas fa-money-check"></i><span>Quản lý đơn hàng</span>
                                </li>
                            </a>
                            <a href="${pageContext.request.contextPath}/favorite_product">
                                <li class="slide-bar "><i class="far fa-heart"></i><span>Sản phẩm yêu thích</span>
                                </li>
                            </a>
                            <a href="${pageContext.request.contextPath}/address_deliver">
                                <li class="slide-bar active"><i
                                        class="fas fa-map-marker"></i><span> Địa chỉ giao hàng</span></li>
                            </a>
                            <a href="${pageContext.request.contextPath}/customer/profile-reset-password.jsp">
                                <li class="slide-bar"><i class="fas fa-lock"></i><span> Đổi mật khẩu</span></li>
                            </a>
                        </ul>
                    </div>
                </div>
                <div class="right-container">
                    <h3 class="title-content">Địa chỉ của tôi</h3>
                    <div class="show-address" id="show-address">
                        <div class="infor">
                            <div class="name">Tên: <span class="black-color"> ${address.fullName}</span>
                            </div>
                            <div class="address">
                                <span>Địa chỉ: </span>
                                <span class="black-color"> ${address.detail}, ${address.ward}, ${address.district}, ${address.province}</span>
                            </div>
                            <div class="phone">
                                <span>Điện thoại: </span>
                                <span class="black-color"> ${address.phone}</span>
                            </div>
                        </div>
                        <div class="action">
                            <button onclick="editAddress()" class="text-blue">Chỉnh sửa</button>
                        </div>
                    </div>
                    <div class="edit-address" id="edit-address" style="display: none;">
                        <jsp:include page="/sub-component/address-form.jsp"/>
                    </div>
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
    function editAddress() {
        $('#show-address').hide();
        $('#edit-address').show();
    }
</script>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

</html>