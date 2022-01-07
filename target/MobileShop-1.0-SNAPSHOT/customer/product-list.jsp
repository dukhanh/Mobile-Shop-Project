<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.math.RoundingMode" %>
<!DOCTYPE html>
<html lang="en">


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>

<% Locale locale = new Locale("vi", "VN");%>
<% NumberFormat formatNum = NumberFormat.getCurrencyInstance(locale);%>
<% formatNum.setRoundingMode(RoundingMode.HALF_UP);%>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>
</head>

<body>
<!-- top-header-->
<jsp:include page="/sub-component/header-menu.jsp"/>

<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li><a href="../customer/index.jsp">Trang chủ</a></li>
                        <li>Điện thoại</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /. header-section-->
<!-- product-list -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <!-- sidenav-section -->
                <div id='cssmenu'>
                    <ul>
                        <li class='has-sub'><a href='#'>Hệ điều hành</a>
                            <ul>

                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Tất cả</span></label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Android</span></label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">ISO</span>
                                    </label>
                                </li>

                            </ul>
                        </li>
                        <li class='has-sub'><a href='#'>Hãng sản xuất</a>
                            <ul>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Tất cả </span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Samsung</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Apple</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Xiaomi</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Vsmart</span>
                                    </label>
                                    </span>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">OPPO</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Vivo</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Nokia</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Huawei</span>
                                    </label>
                                </li>

                            </ul>
                        </li>
                        <li class='has-sub'><a href='#'>Giá Bán</a>
                            <ul>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Tất cả</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Dưới 2 triệu</span>
                                    </label>
                                </li>
                                <li><span>
                                            <label>
                                                <input type="checkbox">
                                                <span class="checkbox-list">Từ 2 - 5 triệu</span>
                                            </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Từ 5 - 10 triệu</span>
                                    </label>
                                </li>

                                <li><span>
                                            <label>
                                                <input type="checkbox">
                                                <span class="checkbox-list">Từ 10 - 15 triệu</span>
                                            </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Trên 15 triệu</span>
                                    </label>
                                </li>

                            </ul>
                        </li>
                        <li class='has-sub'><a href='#'>Màn hình</a>
                            <ul>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Tất cả</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Dưới 5.0 inch</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Trên 6.0 inch</span>
                                    </label>
                                </li>

                            </ul>
                        </li>
                        <li class='has-sub'><a href='#'>Bộ nhớ trong</a>
                            <ul>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Tất cả</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Dưới 32GB</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">64GB và 128GB</span>
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">256GB và 512GB</span>
                                    </label>
                                </li>

                                <li>
                                    <label>
                                        <input type="checkbox">
                                        <span class="checkbox-list">Trên 512GB</span>
                                    </label>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
                <!-- /.sidenav-section -->
            </div>
            <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb10 alignright">
                        <form>
                            <div class="select-option form-group">
                                <select name="select" class="form-control" placeholder="Sắp xếp theo">
                                    <option value="" default>Sắp xếp theo</option>
                                    <option value="">Bán Chạy</option>
                                    <option value="">Giá Thấp</option>
                                    <option value="">Giá Cao</option>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <!-- product -->
                    <jsp:useBean id="products" scope="request" type="java.util.List"/>
                    <c:forEach var="p" items="${products}">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
                            <a href="#">
                                <div class="product-block">
                                    <div class="product-img"><img src="${p.imageUrl}" alt=""></div>
                                    <div class="product-content">
                                        <h5 class="product-title">${p.name}</h5>
                                        <div class="product-meta">
                                            <fmt:setLocale value="vi_VN"/>
                                            <c:choose>
                                                <c:when test="${p.price == p.priceSale}">
                                                    <a href="#" class="product-price">
                                                        <fmt:formatNumber value="${p.priceSale}"/> vnđ
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="#" class="discounted-price">
                                                        <fmt:formatNumber value="${p.price}"/> vnđ
                                                    </a>
                                                    <a href="#" class="product-price">
                                                        <fmt:formatNumber value="${p.priceSale}"/> vnđ
                                                    </a>

                                                </c:otherwise>
                                            </c:choose>


                                                <%--                                            <span class="offer-price">20%off</span>--%>
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
                    </c:forEach>

                    <!-- /.product -->

                </div>
                <div class="row">
                    <!-- pagination start -->
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="st-pagination">
                            <ul class="pagination">
                                <%--                                <jsp:useBean id="pages" scope="request" type="java.util.List"/>--%>
                                <c:forEach begin="1" end="${pages}" var="i">
                                    <li class=""><a
                                            href="ProductList?page=${i}"${index==i?"style=\"background:rgb(234,113,39);\"":""}>${i}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <!-- pagination close -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.product-list -->
<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>

<script type="text/javascript">
    (function ($) {
        $(document).ready(function () {
            $('#cssmenu ul ul li:odd').addClass('odd');
            $('#cssmenu ul ul li:even').addClass('even');
            $('#cssmenu > ul > li > a').click(function () {
                $('#cssmenu li').removeClass('active');
                $(this).closest('li').addClass('active');
                var checkElement = $(this).next();
                if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                    $(this).closest('li').removeClass('active');
                    checkElement.slideUp('normal');
                }
                if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                    $('#cssmenu ul ul:visible').slideUp('normal');
                    checkElement.slideDown('normal');
                }
                if ($(this).closest('li').find('ul').children().length == 0) {
                    return true;
                } else {
                    return false;
                }
            });
        });
    })(jQuery);
</script>
</body>


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/product-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:53 GMT -->

</html>