<jsp:useBean id="product" scope="request" type="model.Product"/>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/sub-component/taglib.jsp" %>

<% List<String> list = (List<String>) request.getAttribute("images");%>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>

</head>

<body>
<div class="confirm-message" id="message" style="display:none;">
</div>
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
                                    <div style="display:flex;align-items:center;">
                                        <div class="product-rating rate-average-small" style="margin-bottom: 3px;">
                                            <script>$(function () {
                                                $(".rate-average-small").rateYo({
                                                    rating: ${rateAverage},
                                                    starWidth: "15px",
                                                    spacing: "5px",
                                                    required: true,
                                                });

                                            });</script>

                                        </div>
                                        <span class="text-secondary">&nbsp;(${countAssess} đánh giá)</span>
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
                                    <form action="buy_now" method="POST">
                                        <div class="product-quantity">
                                            <h4>Số lượng</h4>
                                            <div class="quantity mb20">
                                                <button class="btn-quantity decrease-quantity" type="button"
                                                        onclick="decreaseQuantity(this)">-
                                                </button>
                                                <input type="number" name="quantity" value="1"
                                                       class="quantity-input" id="quantity-single">
                                                <button class="btn-quantity increase-quantity" type="button"
                                                        onclick="increaseQuantity(this,${product.quantity})">+
                                                </button>
                                            </div>
                                            <span class="rest-quantity">${product.quantity} sản phẩm có sẵn</span>
                                        </div>
                                        <div style="display:flex">
                                            <div style="margin-right:10px">
                                                <input hidden name="productId" value="${product.id}">
                                                <button class="btn btn-default btn-buy-now" type="submit">
                                                    Mua Ngay
                                                </button>
                                            </div>

                                            <button type="button" class="btn btn-default"
                                                    onclick="addToCart(${product.id},${sessionScope.account!=null})">
                                                <i class="fa fa-shopping-cart"></i>&nbsp;Thêm vào giỏ hàng
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
                            <c:forEach var="i" items="${confi}">
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
                                            <h1 class="score-rating">${rateAverage}</h1>
                                        </div>
                                        <div>
                                            <div class="product-rating rate-average">
                                                <script>$(function () {
                                                    $(".rate-average").rateYo({
                                                        rating: ${rateAverage},
                                                        starWidth: "25px",
                                                        spacing: "5px",
                                                        required: true,
                                                    });

                                                });</script>
                                            </div>
                                            <p class="text-secondary" style="padding:15px 5px;">${countAssess} nhận
                                                xét</p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row review-box">
                                <div class="customer-reviews" id="list-assess-ajax">
                                    <c:forEach items="${listAssess}" var="r">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <p class="reviews-text"><span class="text-default">${r.nameAssess}</span>
                                            </p>
                                            <div class="product-rating rate-star">
                                                <c:forEach var="s" begin="1" end="${r.rate}">
                                                    <span><i class="fa fa-star"></i></span>
                                                </c:forEach>

                                                <c:forEach var="s" begin="${r.rate+1}" end="5">
                                                    <span><i class="fa fa-star-o"></i></span>
                                                </c:forEach>
                                            </div>
                                            <p>${r.review}</p>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="divider-line"></div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="new-review">
                                    <button type="button" class="bg-default"
                                            onclick="openAsses(${sessionScope.account!=null})"><i
                                            class="far fa-star"></i> Viết đánh giá
                                    </button>
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

                    <!-- /.product -->
                </div>
            </div>
        </div>
    </div>
    <!-- /.product-single -->
</div>

<div id="new-review-box" class="new-review-box">
    <div class="asses-top">
        <h2>Đánh giá</h2>
        <div class="btn-close" onclick="closeAsses()"><i class="fas fa-times"></i> Đóng</div>
    </div>
    <div class="asses-main">
        <form action="${pageContext.request.contextPath}/add_assess" method="post" id="assess-form">
            <div class="information-product">
                <img src="${product.imageUrl}" alt="">
                <p>${product.name}</p>
            </div>
            <div class="select-star">
                <p>Bạn cảm thấy sản phẩm này như thế nào?</p>
                <div class="star-rating">
                    <input type="radio" name="rating" value="5" id="rate-1" required>
                    <label for="rate-1"><i class="fas fa-star"></i></label>
                    <input type="radio" name="rating" value="4" id="rate-2" required>
                    <label for="rate-2"><i class="fas fa-star"></i></label>
                    <input type="radio" name="rating" value="3" id="rate-3" required>
                    <label for="rate-3"><i class="fas fa-star"></i></label>
                    <input type="radio" name="rating" value="2" id="rate-4" required>
                    <label for="rate-4"><i class="fas fa-star"></i></label>
                    <input type="radio" name="rating" value="1" id="rate-5" required>
                    <label for="rate-5"><i class="fas fa-star"></i></label>
                </div>
            </div>
            <div class="review">

                <textarea name="review" cols="71" rows="3" placeholder="Viết đánh giá của bạn" required></textarea>

            </div>
            <input type="hidden" name="productId" value="${product.id}">
            <button class="btn-default" type="submit">Gửi đánh giá ngay</button>
        </form>
    </div>
</div>
<div id="overlay" style="display:none"></div>

<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
<script type="text/javascript" src="<c:url value="/assets/js/product-single.js"/>"></script>

</body>
<script>
    $('#assess-form').submit(function () {
        const form = $(this);
        const url = form.attr('action');
        const data = form.serialize();
        $.ajax({
            type: 'POST',
            url: url,
            data: data,
            success: function (data) {
                $("#new-review-box").css('display', 'none');
                $("#overlay").css('display', 'none');
                $("#assess-form").trigger("reset");

                const listReview = document.getElementById('list-assess-ajax');
                listReview.innerHTML = data;
            }
        })
        return false;
    });
</script>
</html>