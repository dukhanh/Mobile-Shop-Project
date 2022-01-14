<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% List<String> list = (List<String>) request.getAttribute("images");%>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>
</head>

<body>
<!-- top-header-->
<jsp:include page="/sub-component/header-menu.jsp"/>
<!-- page-header -->

<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li><a href="#">Trang chủ</a></li>
                        <li>Chi tiết sản phẩm</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.page-header-->
<!-- product-single -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box">
                    <!-- product-description -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                <ul id="demo1_thumbs" class="slideshow_thumbs">
                                    <% for (String img : list) { %>

                                    <li>
                                        <a href="<%= img %>">
                                            <div class=" thumb-img"><img src="<%= img %>" alt=""></div>
                                        </a>
                                    </li>
                                    <% } %>

                                </ul>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div id="slideshow"></div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="product-single">
                                    <h2>${product.name}</h2>
                                    <div class="product-rating">
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star-o"></i></span>
                                        <span class="text-secondary">&nbsp;(12 đánh giá)</span>
                                    </div>

                                    <div class="product-brand">
                                        <p>Thương hiệu: <a href="">${product.brand}</a></p>
                                    </div>
                                    <fmt:setLocale value="vi_VN"/>
                                    <div class="product-price" style="font-size: 25px;">
                                        <c:choose>
                                            <c:when test="${product.price > product.priceSale}">
                                                <p class="price-sale"><fmt:formatNumber value="${product.priceSale}"/>
                                                    vnđ</p>
                                                <p class="original-price"><strike><fmt:formatNumber
                                                        value="${product.price}"/> vnđ</strike></p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="price-sale"><fmt:formatNumber value="${product.priceSale}"/>
                                                    vnđ</p>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>

                                    <div class="product-color">
                                        <p>Màu sắc: <span>${product.color}</span></p>
                                    </div>

                                    <div class="product-quantity">
                                        <h4>Số lượng</h4>
                                        <div class="quantity mb20">
                                            <button class="btn-quantity decrease-quantity" type="button">-</button>
                                            <input type="number" max="5" min="1" name="quantity" value="1"
                                                   class="quantity-input">
                                            <button class="btn-quantity increase-quantity" type="button">+</button>
                                        </div>
                                        <span class="rest-quantity">${product.quantity} sản phẩm có sẵn</span>
                                    </div>
                                    <div>
                                        <button class="btn btn-default btn-buy-now">
                                            Mua Ngay
                                        </button>
                                        <button type="submit" class="btn btn-default">
                                            <i class="fa fa-shopping-cart"></i>&nbsp;Thêm vào giỏ hàng
                                        </button>

                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="description-details">
                    <div class="description-right">
                        <h2 class="dgctpro">Thông tin chi tiết</h2>
                        <table class="charactestic_table">
                            <tbody>
                            <jsp:useBean id="confi" scope="request" type="java.util.List"/>
                            <c:forEach var="i" items = "${confi}">
                                <tr>
                                    <td class="title_charactestic">
                                        ${i.name}
                                    </td>
                                    <td class="content_charactestic">
                                        ${i.value}
                                    </td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                    <div class="description-left">
                        <h2 class="dgctpro">Đặc điểm nổi bật</h2>
                        <div itemprop="description" class="content_hide content-desc">
                            ${product.description}
                        </div>
                        <button class="more-evaluation text-center"><i class="fa fa-plus-circle"></i> Xem
                            thêm
                        </button>

                    </div>
                </div>
            </div>
        </div>
        <!-- rating reviews  -->
        <div id="rating">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <div class="box container-rating-review">
                        <div class="box-head">
                            <h3 class="head-title">Đánh giá và nhận xét</h3>
                        </div>
                        <div class="box-body">
                            <div class="row  rating-box">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="rating-review">
                                        <div class="">
                                            <h1 class="score-rating">4</h1>
                                        </div>
                                        <div>
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <p class="text-secondary">12 nhận xét</p>
                                        </div>
                                    </div>
                                    <div class="rating-view-details">
                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </div>
                                            <span>12</span>
                                        </div>

                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <span>0</span>
                                        </div>
                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <span>0</span>
                                        </div>

                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <span>0</span>
                                        </div>
                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <span>0</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row review-box">
                                <div class="customer-reviews">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <p class="reviews-text"><span class="text-default">Nika Nguyen</span></p>
                                        <div class="product-rating">
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                        </div>
                                        <p>Giao hàng siêu đúng hẹn, hàng cũng được đóng gói cẩn thận.
                                            Hiện tại mình xài được vài bữa thì không bị vấn đề gì.
                                            Hàng của shopdunk thì không lo về chất lượng.</p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="divider-line"></div>
                                    </div>
                                </div>
                                <div class="customer-reviews">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <p class="reviews-text"><span class="text-default">Lưu Tee</span>
                                        </p>
                                        <div class="product-rating">
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                        </div>

                                        <p>Mặc dù vận chuyển lâu do lỗi, nhưng shop vẫn hỗ trợ mình rất nhiệt tình
                                        </p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="divider-line"></div>
                                    </div>
                                </div>
                                <div class="customer-reviews">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <p class="reviews-text"> <span class="text-default">William
                                                    Cassidy</span>
                                        </p>
                                        <div class="product-rating">
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                        </div>

                                        <p>Sản phẩm rất tốt vì là lần đầu tôi mua trên mạng đt nên thấy khá là lo
                                            lắng nhưng khi nhận đc hàng thì tôi lại thấy tốt hơn mong đợi của mình
                                            chúc Shop làm ăn mua may bán đắt</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <div id="review">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="box">
                            <div class="box-head">
                                <h3 class="head-title">Đánh giá và nhận xét của bạn</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="review-form">

                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 review-left">
                                            <div class="review-rating">
                                                <h4>Đánh giá của bạn về sản phẩm này</h4><br/>
                                                <div class="star-rate" id="rateYo"></div>
                                            </div>
                                        </div>
                                        <form class="review-right">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label sr-only " for="name"></label>
                                                    <input id="name" type="text" class="form-control"
                                                           placeholder="Họ tên" required="">
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label sr-only " for="email"></label>
                                                    <input id="email" type="text" class="form-control"
                                                           placeholder="Email" required="">
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label sr-only " for="textarea"></label>
                                                    <textarea class="form-control" id="textarea" name="textarea"
                                                              rows="4" placeholder="Mời bạn nhập bình luận"></textarea>
                                                </div>
                                                <button id="submit" name="singlebutton" class="btn btn-primary">Gửi
                                                    đánh giá
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.reviews-form -->

        </div>


    </div>
    <!-- /.product-description -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box-head">
                    <h3 class="head-title">Sản phẩm liên quan</h3>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-body">
                <div class="row">
                    <!-- product -->
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img"><img src="../assets/images/product_img_1.png" alt=""></div>
                            <div class="product-content">
                                <h5><a href="#" class="product-title">Google Pixel <strong>(128GB,
                                    Black)</strong></a></h5>
                                <div class="product-meta"><a href="#" class="product-price">$1100</a>
                                    <a href="#" class="discounted-price">$1400</a>
                                    <span class="offer-price">20%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                    <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.product -->
                    <!-- product -->
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img"><img src="../assets/images/product_img_2.png" alt=""></div>
                            <div class="product-content">
                                <h5><a href="#" class="product-title">HTC U Ultra <strong>(64GB, Blue)</strong></a>
                                </h5>
                                <div class="product-meta"><a href="#" class="product-price">$1200</a>
                                    <a href="#" class="discounted-price">$1700</a>
                                    <span class="offer-price">10%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                    <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.product -->
                    <!-- product -->
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img"><img src="../assets/images/product_img_3.png" alt=""></div>
                            <div class="product-content">
                                <h5><a href="#" class="product-title">Samsung Galaxy Note 8</a></h5>
                                <div class="product-meta"><a href="#" class="product-price">$1500</a>
                                    <a href="#" class="discounted-price">$2000</a>
                                    <span class="offer-price">40%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                    <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.product -->
                    <!-- product -->
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img"><img src="../assets/images/product_img_4.png" alt=""></div>
                            <div class="product-content">
                                <h5><a href="#" class="product-title">Vivo V5 Plus <strong>(Matte
                                    Black)</strong></a></h5>
                                <div class="product-meta"><a href="#" class="product-price">$1500</a>
                                    <a href="#" class="discounted-price">$2000</a>
                                    <span class="offer-price">15%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like">
                                        <i class="fa fa-heart"></i></a>
                                    <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.product -->
                </div>
            </div>
        </div>
    </div>
    <!-- /.product-single -->
</div>
<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>

<script type="text/javascript" src="<c:url value="/assets/js/quantity-product.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/js/product-single.js"/>"></script>

</body>

</html>