<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/sub-component/taglib.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<fmt:setLocale value="vi_VN"/>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>
</head>

<body>
<!-- top-header-->
<jsp:include page="/sub-component/header-menu.jsp"/>
<!-- /. header-section-->
<!-- slider -->

<%-- message success register account --%>

<c:if test="${messageSuccess!=null}">
    <script>
        window.onload = function() {
            document.getElementById('btn-message').click();
        }
    </script>

    <!-- Button trigger modal -->
    <button style="padding: -30px; visibility: hidden; z-index: 99999"
            type="button" id="btn-message" class="btn btn-white"
            data-toggle="modal" data-target="#exampleModalCenter"></button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1"
         role="dialog" aria-labelledby="exampleModalCenterTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">${messageSuccess}</h5>
                </div>
                <div class="modal-body">
                    <p>Vui lòng cập nhật thông tin cá nhân
                    <p>
                </div>
                <div class="modal-footer">
                    <a href="${pageContext.request.contextPath}/member/profile"
                       class="btn btn-primary" role="button">Cập nhật</a>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cập
                        nhật sau</button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<div class="slider">
    <div class="owl-carousel owl-one owl-theme">
        <div class="item">
            <div class="slider-img">
                <img src="/assets/images/slider_1.jpg" alt=""></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-8 col-sm-6 col-xs-12">
                        <div class="slider-captions">
                            <div class="brand-img">
                                <img src="/assets/images/mi_logo.png" alt="">
                            </div>
                            <h1 class="slider-title">Red Mi <span>Y1</span></h1>
                            <p class="hidden-xs">LED Selfie-light | Fingerprint sensor | Dedicated microSD card slot
                                Snapdragon 435 octa-core processor </p>
<%--                            <p class="slider-price">$138.99 </p>--%>
<%--                            <a href="cart.html" class="btn btn-primary btn-lg hidden-xs">Buy Now</a>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="slider-img"><img src="/assets/images/slider_2.jpg" alt=""></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-8 col-sm-6 col-xs-12">
                        <div class="slider-captions">
                            <div class="brand-img">
                                <img src="/assets/images/google_logo.png" alt="">
                            </div>
                            <h1 class="slider-title">Google Pixel 2</h1>
                            <p class="hidden-xs">The latest Qualcomm Snapdragon 835 processor | Water-resistant metal
                                unibody | Up to 7 hours of battery.</p>
                            <%--                            <p class="slider-price">$ 938.10</p>--%>
                            <%--                            <a href="cart.html" class="btn btn-primary btn-lg hidden-xs">Buy Now</a>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="slider-img"><img src="/assets/images/slider_3.jpg" alt=""></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-8 col-sm-6 col-xs-12">
                        <div class="slider-captions">
                            <div class="brand-img">
                                <img src="/assets/images/apple_logo.png" alt="">
                            </div>
                            <h1 class="slider-title">iphone 8 plus </h1>
                            <p class="hidden-xs">5.5 inch Retina HD Display | 12MP wide-angle cameras
                                <br> | 64 GB &amp; 256 GB ROM Memory</p>
                            <%--                                <p class="slider-price">$759.64</p>--%>
                            <%--                                <a href="cart.html" class="btn btn-primary btn-lg hidden-xs">Buy Now</a>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.slider -->
<!-- mobile showcase -->
<div class="pdt80 pdb20">
    <div class="container">
        <div class="row">
            <jsp:useBean id="listBrandLogo" scope="request" type="java.util.List"/>
            <c:forEach items="${listBrandLogo}" var="list">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <a href="productlist?ibrand=${list.id}">
                        <div class="showcase-block">
                            <img src="${list.logo}" alt="">
                        </div>
                    </a>
                </div>
            </c:forEach>

        </div>
    </div>
</div>
<!-- /.mobile showcase -->
<!-- latest products -->
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="box">
                <div class="box-head">
                    <h3 class="head-title"><a href="productlist?&sort=best_new">Sản phẩm mới nhất</a></h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <!-- product -->
                        <jsp:useBean id="listProductBestNew" scope="request" type="java.util.List"/>
                        <c:forEach items="${listProductBestNew}" var="p">
                            <div class="col-sm-3 m-0" style="padding: 2px;">
                                <a href="productdetails?id=${p.id}">
                                    <div class="product-block">
                                        <div class="product-img"><img src="${p.imageUrl}" alt=""></div>
                                        <div class="product-content">
                                            <h5 class="product-title">${p.name}</h5>
                                            <div class="product-meta">
                                                <c:if test="${p.price > p.priceSale}">
                                                    <a href="#" class="discounted-price">
                                                        <fmt:formatNumber value="${p.price}"/> vnđ
                                                    </a>
                                                </c:if>
                                                <a href="#" class="product-price">
                                                    <fmt:formatNumber value="${p.priceSale}"/> vnđ
                                                </a>
                                            </div>
                                            <div class="shopping-btn">
                                                <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                                <a href="#" class="product-btn btn-cart"><i
                                                        class="fa fa-shopping-cart"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- /.product -->
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.latest products -->
<!-- seller products -->
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="box">
                <div class="box-head">
                    <h3 class="head-title"><a href="productlist?&sort=top_seller">Bán chạy nhất</a></h3>
                </div>
            </div>
        </div>
    </div>
    <div class="product-carousel">
        <div class="box-body">
            <div class="row">
                <div class="owl-carousel owl-two owl-theme">
                    <!-- product -->
                    <jsp:useBean id="listProductTopSeller" scope="request" type="java.util.List"/>
                    <c:forEach items="${listProductTopSeller}" var="p">
                        <div class="item">
                            <div class="col-lg-12 m-0" style="padding: 2px;">
                                <a href="productdetails?id=${p.id}">
                                    <div class="product-block">
                                        <div class="product-img"><img src="${p.imageUrl}" alt=""></div>
                                        <div class="product-content">
                                            <h5 class="product-title">${p.name}</h5>
                                            <div class="product-meta">
                                                <c:if test="${p.price > p.priceSale}">
                                                    <a href="#" class="discounted-price">
                                                        <fmt:formatNumber value="${p.price}"/> vnđ
                                                    </a>
                                                </c:if>
                                                <a href="#" class="product-price">
                                                    <fmt:formatNumber value="${p.priceSale}"/> vnđ
                                                </a>
                                            </div>
                                            <div class="shopping-btn">
                                                <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                                <a href="#" class="product-btn btn-cart"><i
                                                        class="fa fa-shopping-cart"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>


                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.seller products -->
<!-- featured products -->
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="box">
                <div class="box-head">
                    <h3 class="head-title"><a href="productlist?&sort=promotion">Đang khuyến mãi</a></h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <!-- product -->
                        <jsp:useBean id="listProductPromotions" scope="request" type="java.util.List"/>
                        <c:forEach items="${listProductPromotions}" var="p">
                            <div class="col-sm-3 m-0" style="padding: 2px;">
                                <a href="productdetails?id=${p.id}">
                                    <div class="product-block">
                                        <div class="product-img"><img src="${p.imageUrl}" alt=""></div>
                                        <div class="product-content">
                                            <h5 class="product-title">${p.name}</h5>
                                            <div class="product-meta">
                                                <c:if test="${p.price > p.priceSale}">
                                                    <a href="#" class="discounted-price">
                                                        <fmt:formatNumber value="${p.price}"/> vnđ
                                                    </a>
                                                </c:if>
                                                <a href="#" class="product-price">
                                                    <fmt:formatNumber value="${p.priceSale}"/> vnđ
                                                </a>
                                            </div>
                                            <div class="shopping-btn">
                                                <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                                <a href="#" class="product-btn btn-cart"><i
                                                        class="fa fa-shopping-cart"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- /.product -->
                        </c:forEach>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.featured products -->
<!-- cta -->
<!-- /.cta -->
<!-- features -->
<div class="bg-default pdt40 pdb40">
    <div class="container">
        <div class="row">
            <!-- features -->
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="feature-left">
                    <div class="feature-outline-icon">
                        <i class="fa fa-credit-card"></i>
                    </div>
                    <div class="feature-content">
                        <h3 class="text-white">Thanh toán an toàn</h3>
                        <p>Mang đến dịch vụ trải nghiệm thoải mái nhất, an toàn, tiện dụng, Mobistore! </p>
                    </div>
                </div>
            </div>
            <!-- features -->
            <!-- features -->
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="feature-left">
                    <div class="feature-outline-icon">
                        <i class="fa fa-users"></i>
                    </div>
                    <div class="feature-content">
                        <h3 class="text-white">Phản hồi 24/7</h3>
                        <p>Trợ giúp liên lạc, tham khảo , tra cứu 24/7!</p>
                    </div>
                </div>
            </div>
            <!-- features -->
            <!-- features -->
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="feature-left feature-circle">
                    <div class="feature-outline-icon">
                        <i class="fa fa-rotate-left "></i>
                    </div>
                    <div class="feature-content">
                        <h3 class="text-white">Đổi trả miễn phí</h3>
                        <p>Miễn phí bảo hành đổi trả lên đến 365 ngày!</p>
                    </div>
                </div>
            </div>
            <!-- features -->
            <!-- features -->
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="feature-left">
                    <div class="feature-outline-icon">
                        <i class="fa fa-dollar"></i>
                    </div>
                    <div class="feature-content">
                        <h3 class="text-white">Giá tốt nhất</h3>
                        <p>Giá thành tốt nhất trong thị trường. Cập nhật sản phẩm 24/7!</p>
                    </div>
                </div>
            </div>
            <!-- features -->
        </div>
    </div>
</div>
<!-- /.features -->
<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
</body>

</html>
