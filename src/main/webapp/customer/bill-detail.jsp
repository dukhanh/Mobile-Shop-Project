<%@ page import="service.BillService" %>
<%@ page import="model.Bill" %>
<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/sub-component/taglib.jsp" %>
<fmt:setLocale value="vi_VN"/>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<% Bill bill = (Bill) request.getAttribute("bill");%>
<head>
    <jsp:include page="/sub-component/header.jsp"/>
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
                        <li>Chi tiết đơn hàng</li>
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
            <div class="row-account" style="display: block;">
                <div class="right-container" style="margin: 0 auto; width: 90%">
                    <h3 class="title-content">Đơn hàng đã đặt/ Chi tiết đơn hàng</h3>
                    <div class="receipt-infor-details">
                        <div class="title-receipt">
                            <div class="left-content content">
                                <h4>ĐƠN HÀNG</h4>
                                <p class="receipt-id">Mã đơn hàng: ${bill.idBill}</p>
                                <p class="receipt-time">Đặt hàng: ${bill.createdAt}</p>
                                <p>Trạng thái:
                                    <span style="color: #ff5656;" id="status-receipt">${bill.status}</span>
                                </p>
                            </div>
                            <div class="right-content content">
                                <h4>THÔNG TIN NHẬN HÀNG</h4>
<%--                                <p>${sessionScope.address.fullName} - ${sessionScope.address.phone}</p>--%>
<%--                                <p class="address">${sessionScope.address.detail}, ${sessionScope.address.ward}, ${sessionScope.address.district}, ${sessionScope.address.province}</p>--%>
                                <p>${bill.address}</p>
                            </div>
                        </div>
                        <table class="table">
                            <thead class="thead-light">
                            <tr>
                                <th>Sản phẩm</th>
                                <th scope="col">Đơn giá</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Thành tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${billDetail}" var="p">
                                <tr>
                                    <td>
                                        <div class="product-title">
                                            <img src="${p.imageProduct}" alt="">
                                            <div>
                                                <p>${p.productName}</p>
                                                <c:if test="${p.colorProduct!=null}">
                                                    <p>Màu sắc: ${p.colorProduct}</p>
                                                </c:if>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="item-center"><fmt:formatNumber
                                                value="${p.priceBill}"/> đ
                                        </div>
                                    </td>
                                    <td>
                                        <div class="item-center">${p.quantity}</div>
                                    </td>
                                    <td>
                                        <div class="item-center"><fmt:formatNumber
                                                value="${p.priceBill*p.quantity}"/> đ
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>

                            <tfoot>
                            <tr>
                                <td scope="row"></td>
                                <td></td>
                                <td scope="row">
                                    <div>
                                        <p>Tổng tiền:</p>
                                        <p>Phí vận chuyển:</p>
                                        <p>Tổng thanh toán:</p>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <p><fmt:formatNumber
                                                value="${totalBill}"/> đ</p>
                                        <p><fmt:formatNumber
                                                value="${bill.shipFee}"/> đ</p>
                                        <p><fmt:formatNumber
                                                value="${totalBill+bill.shipFee}"/> đ</p>
                                    </div>
                                </td>
                            </tr>

                            </tfoot>
                        </table>
                        <a href="${pageContext.request.contextPath}/bill_list" class="redirect-to-receipt text-blue"><i
                                class="fas fa-long-arrow-alt-left"></i> Danh sách đơn hàng</a>
                    </div>
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


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:06 GMT -->

</html>