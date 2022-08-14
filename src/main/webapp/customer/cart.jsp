<!DOCTYPE html>
<html lang="en">


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/sub-component/taglib.jsp" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>
    <script type="text/javascript" src="<c:url value="/assets/js/js_pages/cart.js"/>"></script>
    <title>Giỏ hàng</title>
</head>
<fmt:setLocale value="vi_VN"/>
<script>
    window.onload = function(){
        checkAllItem();
        calTotalCart();
    }
</script>
<body>

<!-- top-header-->
<jsp:include page="/sub-component/header-menu.jsp"/>
<!-- /. header-section-->
<!-- page-header -->
<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <div class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li><a href="#">Trang chủ</a></li>
                        <li>Giỏ hàng</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- /.page-header-->
<!-- cart-section -->

<div class="container">
    <div class="cart-content mt30 mb30">
        <div class="title-header mb20">
            <h2 class="title">Giỏ Hàng</h2>
        </div>
        <jsp:useBean id="cartList" scope="request" type="java.util.List"/>
        <c:choose>
            <c:when test="${fn:length(cartList)>0}">
                <form action="checkout" method="POST" onsubmit="return isChecked()">
                    <table class="table" id="cart-table">
                        <thead class="thead-light">
                        <tr>
                            <th>
                                <div class="item-center pdl10"><label for="check-all"></label>
                                    <input id="check-all" type="checkbox" class="checkbox-element">
                                </div>
                            </th>
                            <th>Sản phẩm</th>
                            <th scope="col">Đơn giá</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">
                                <button class="delete-product" type="button" onclick="deleteProductSelected()">
                                    <i class="far fa-trash-alt" style="font-size:20px; cursor:pointer;"></i>
                                </button>
                            </th>

                        </tr>
                        </thead>
                        <tbody id="list-product-cart">
                        <c:forEach items="${cartList}" var="p" varStatus="loop">
                            <tr>
                                <td>
                                    <div class="item-center pdl10"><label>
                                        <input type="checkbox" name="selected"
                                               value="${p.id}" ${buyNowProduct==p.id?'checked':''}
                                               class="checkbox-element checkbox-element-child">
                                    </label></div>
                                </td>
                                <td>
                                    <div class="product-title item-center" style="width:100%">
                                        <a href="productdetails?id=${p.id}"><img src="${p.imageUrl}" alt=""></a>
                                        <div style="margin-left:20px;">
                                            <a href="productdetails?id=${p.id}"><p>${p.name}</p></a>
                                            <p>Màu sắc: ${p.color}</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="item-center text-red"><p id="price-product">
                                        <fmt:formatNumber
                                            value="${p.priceSale}"/></p> vnđ
                                    </div>
                                </td>
                                <td>
                                    <div class="item-center">
                                        <div class="quantity">
                                            <button class="btn-quantity decrease-quantity"
                                                    onclick="decreaseQuantityInCart(this,${p.id})" type="button">-
                                            </button>
                                            <input type="number" value="${p.quantity}"
                                                   class="quantity-input quantity-product-cart" readonly>
                                            <button class="btn-quantity increase-quantity"
                                                    onclick="increaseQuantityInCart(this,${p.id})" type="button">+
                                            </button>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="item-center pinside10">
                                        <button class="delete-product" type="button"
                                                onclick="deleteProductInCart(${p.id},${loop.index})"><i
                                                class="far fa-trash-alt"></i></button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="prices-summary">
                        <div class="left-content">
                            <a href="${pageContext.request.contextPath}/productlist"
                               class="derection-product text-blue"><i
                                    class="fas fa-long-arrow-alt-left"></i> Tiếp tục
                                mua hàng</a>
                        </div>
                        <div class="right-con">
                            <div class="total-receipt">
                                <div class="promotion-code pinside20">
                                    <input type="text" class="input-code" placeholder="Nhập mã ưu đãi">
                                    <button type="button" class="submit-code btn-default">Áp dụng</button>
                                </div>
                                <ul class="prices pinside20">
                                    <li class="prices-item">
                                        <span class="prices-text">Tạm tính</span>
                                        <span class="prices-value"><span id="total-price-temp">0 đ</span></span>
                                    </li>
                                    <li class="prices-item">
                                        <span class="prices-text">Giảm giá</span>
                                        <span class="prices-value"><span id="promotion">0 đ</span></span>
                                    </li>
                                </ul>
                                <div class="prices-total pinside20">
                                    <span class="price-text">Tổng cộng</span>
                                    <span class="prices-value prices-final text-red"><span
                                            id="total-price-cart">0 đ</span></span>
                                </div>
                            </div>
                            <button type="submit" onclick="checkIsSelect()" class="btn-default btn-checkout">Mua Hàng
                            </button>
                        </div>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                <div class="cart-null">
                    <i class="fas fa-cart-plus"></i>
                    <p>Giỏ hàng của bạn đang trống</p>
                    <a href="${pageContext.request.contextPath}/productlist">Tiếp tục mua hàng</a>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>

<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
<!-- /.footer -->


</body>

</html>