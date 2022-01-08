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

<% int beforePage = (int) request.getAttribute("index") - 1;%>
<% int afterPage = (int) request.getAttribute("index") + 1;%>

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
                                <li>
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

                                <li>
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
                                                <c:when test="${p.price > p.priceSale}">
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
                    <div class="pagination">
                        <ul>

                            <c:if test="${index > 1}">
                                <a href="ProductList?page=${index-1}">
                                    <li class="btn prev"><span><i class="fas fa-angle-left"></i>Prev</span>
                                    </li>
                                </a>
                            </c:if>
                            <c:if test="${index > 2}">
                                <a href="ProductList?page=${1}">
                                    <li class="first numb"><span>1</span></li>
                                </a>
                                <c:if test="${index > 3}">
                                    <li class="dots"><span>...</span></li>
                                </c:if>
                            </c:if>
                            <c:choose>
                                <c:when test="${index == pages}">
                                    <% beforePage = beforePage - 2; %>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${index == pages-1}">
                                            <% beforePage = beforePage - 1; %>
                                        </c:when>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${index == 1}">
                                    <% afterPage = afterPage + 2; %>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${index == 2}">
                                            <% afterPage = afterPage + 1; %>
                                        </c:when>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                            <c:forEach begin="<%=beforePage%>" end="<%=afterPage%>" var="p">
                                <c:if test="${(p > 0)&&(p< pages+1)}">
                                    <c:choose>
                                        <c:when test="${p == index}">
                                            <a href="ProductList?page=${p}">
                                                <li class="numb active"><span>${p}</span></li>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="ProductList?page=${p}">
                                                <li class="numb"><span>${p}</span></li>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>

                            <c:if test="${index < pages-1}">
                                <c:if test="${index < pages-1}">
                                    <li class="dots"><span>...</span></li>
                                </c:if>
                                <a href="ProductList?page=${pages}">
                                    <li class="last numb"><span>${pages}</span></li>
                                </a>
                            </c:if>
                            <c:if test="${index < pages}">
                                <a href="ProductList?page=${index+1}">
                                    <li class="btn next"><span>Next<i
                                            class="fas fa-angle-right"></i></span></li>
                                </a>
                            </c:if>

                        </ul>
                    </div>

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

</html>