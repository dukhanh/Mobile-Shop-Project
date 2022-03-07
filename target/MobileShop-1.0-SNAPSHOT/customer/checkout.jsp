<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/sub-component/taglib.jsp" %>
<fmt:setLocale value="vi_VN"/>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
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
<body>
<!-- top-header-->
<jsp:include page="/sub-component/header-menu.jsp"/>
<!-- /.page-header-->
<!-- checkout -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                <div class="box checkout-form">
                    <!-- checkout - form -->
                    <div class="box-head">
                        <h4 class="head-title">Địa chỉ giao hàng</h4>
                    </div>
                    <jsp:include page="/sub-component/address.jsp"/>
                </div>
                <div class="product-list">
                    <div class="box-head">
                        <h4 class="head-title">Sản phẩm</h4>
                    </div>
                    <table>
                        <thead>
                        </thead>
                        <tbody>
                        <c:forEach items="${listProduct}" var="p">
                            <tr>
                                <td style="width:100px;">
                                    <img src="${p.imageUrl}" alt="">
                                </td>
                                <td>
                                    <p class="name-phone">${p.name}</p>
                                    <div>
                                        <p class="price-phone"><fmt:formatNumber
                                                value="${p.priceSale}"/> đ</p>
                                        <p class="quantity-phone">Số lượng: ${p.quantity}</p>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>
            </div>
            <!-- product total -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="padding:0;">
                <div class="box mb30">
                    <div class="box-head">
                        <h4 class="head-title">Phương thức thanh toán</h4>
                    </div>
                    <div class="card-container">
                        <div class="card">
                            <div class="card-content">
                                <div><img src="https://laz-img-cdn.alicdn.com/tfs/TB1ZP8kM1T2gK0jSZFvXXXnFXXa-96-96.png"
                                          alt="">
                                    <span>Thanh toán khi nhận hàng</span></div>

                                <input type="radio" name="payment" value="1" checked>
                            </div>
                            <div class="card-footer">
                                <p>Thanh toán khi nhận hàng</p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content">
                                <div><img src="https://laz-img-cdn.alicdn.com/tfs/TB1Iey_osKfxu4jSZPfXXb3dXXa-96-96.png"
                                          alt="">
                                    <span>Thẻ tín dụng/Thẻ ghi nợ</span></div>

                                <input type="radio" name="payment" value="2" disabled>
                            </div>
                            <div class="card-footer">
                                <div class="card-footer-left">
                                    <p>Chọn để thêm thẻ</p>

                                </div>
                                <div class="card-footer-right">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="total-checkout">
                        <div class="price-item">
                            <span>Tiền hàng</span>
                            <span><fmt:formatNumber
                                    value="${total}"/> đ</span>
                        </div>
                        <div class="price-item">
                            <span>Phí giao hàng</span>
                            <span><fmt:formatNumber
                                    value="${shipFee}"/> đ</span>
                        </div>
                        <div class="price-item price-total">
                            <span>Tổng thanh toán</span>
                            <span style="color: #fb730f;font-size:24px;"><fmt:formatNumber
                                    value="${totalBill}"/> đ</span>
                        </div>
                        <form action="bill_detail" method="POST">
                            <c:forEach items="${listProduct}" var="p">
                                <input type="hidden" name="productId" value="${p.id}">
                            </c:forEach>
                            <button class="btn btn-success btn-checkout" type="submit">Đặt mua</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/checkout.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:04 GMT -->

</html>