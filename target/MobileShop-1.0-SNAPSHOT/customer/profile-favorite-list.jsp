<!DOCTYPE html>
<html lang="en">


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/sub-component/taglib.jsp" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>
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
                        <li>Sản phẩm yêu thích</li>
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
                        <img src="../assets/images/user-img.png" alt="">
                        <span>${sessionScope.account.fullName}</span>
                    </div>
                    <div class="side-bar-content">
                        <ul>
                            <a href="${pageContext.request.contextPath}/customer/profile_update">
                                <li class="slide-bar "><i class="fa fa-edit"></i><span>Thông tin tài khoản</span></li>
                            </a>
                            <a href="${pageContext.request.contextPath}/bill_list">
                                <li class="slide-bar "><i class="fas fa-money-check"></i><span>Quản lý đơn hàng</span>
                                </li>
                            </a>
                            <a href="${pageContext.request.contextPath}/favorite_product">
                                <li class="slide-bar active"><i class="far fa-heart"></i><span>Sản phẩm yêu thích</span>
                                </li>
                            </a>
                            <a href="${pageContext.request.contextPath}/update_address">
                                <li class="slide-bar"><i class="fas fa-map-marker"></i><span> Địa chỉ giao hàng</span></li>
                            </a>
                            <!-- <a href="address-deliver.html"><li class="slide-bar"><i class="fas fa-map-marker-alt"></i><span> Địa chỉ nhận hàng</span></li></a> -->
                            <a href="${pageContext.request.contextPath}/reset_password">
                                <li class="slide-bar"><i class="fas fa-lock"></i><span> Đổi mật khẩu</span></li>
                            </a>
                        </ul>
                    </div>
                </div>
                <div class="right-container">
                    <h3 class="title-content">Danh sách sản phẩm yêu thích</h3>
                    <jsp:useBean id="favoriteProducts" scope="request" type="java.util.List"/>
                    <ul class="list-favorites" id="list-favorites">
                        <c:choose>
                            <c:when test="${fn:length(favoriteProducts)>0}">

                                <c:forEach items="${favoriteProducts}" var="product">
                                    <li class="item">
                                        <button type="button" class="btn-delete"
                                                onclick="deleteProductFavorite(${product.id})">x
                                        </button>
                                        <div class="thumbnail">
                                            <a href="productdetails?id=${product.id}" class="img">
                                                <img src="${product.imageUrl}" alt="">
                                            </a>
                                        </div>
                                        <div class="body">
                                            <a href="productdetails?id=${product.id}" class="name">${product.name}</a>
                                        </div>

                                        <div class="footer">
                                            <div class="price-discount"><fmt:formatNumber value="${product.priceSale}"/>
                                                vnđ
                                            </div>
                                            <c:if test="${product.price > product.priceSale}">
                                                <div class="wrap">
                                                    <div class="price"><strike><fmt:formatNumber
                                                            value="${product.price}"/>
                                                        vnđ</strike></div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="null-favorite">
                                    <p>Chưa có danh mục yêu thích</p>
                                    <p>Thêm sản phẩm vào danh sách yêu thích để hiển thị ở đây</p>
                                    <a href="${pageContext.request.contextPath}/productlist">Tiếp tục mua sắm</a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </ul>
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
<script type="text/javascript" src="<c:url value="/assets/js/js_pages/favorite-ajax.js"/>"></script>
<script>

    function deleteProductFavorite(id) {
        //ajax
        $.ajax({
            url: '/delete_favorite',
            type: 'GET',
            data: {
                'productId': id,
            },
            success: function (data) {
                const row = document.getElementById('list-favorites');
                row.innerHTML = data;
            },

        });
    }

</script>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

</html>