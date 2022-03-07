<%@ page import="service.SetURL" %>
<%@ page import="service.FavoriteService" %>
<%@ page import="service.CartService" %>
<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/sub-component/taglib.jsp" %>
<%@ page buffer="8192kb" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<fmt:setLocale value="vi_VN"/>

<% int beforePage = (int) request.getAttribute("index") - 1;%>
<% int afterPage = (int) request.getAttribute("index") + 1;%>
<% String cat = (String) request.getAttribute("category");%>
<% String sort = (String) request.getAttribute("sorttype");%>
<% String price = (String) request.getAttribute("filPrice");%>
<% String[] iBrand = (String[]) request.getAttribute("iBrand");%>
<% String search = (String) request.getAttribute("search");%>

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
                        <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
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
    <div class="container cont-product-list">
        <div class="row div-content">
            <div class="menu">
                <div id='cssmenu'>
                    <table>
                        <tr>
                            <th>Category</th>
                        </tr>
                        <jsp:useBean id="categorylist" scope="request" type="java.util.List"/>
                        <c:forEach items="${categorylist}" var="c">
                            <tr>
                                <td class="${c.id==category?"active":""}">
                                    <a href="productlist?<%=SetURL.setUrlSearch(search)%>&cid=${c.id}<%=SetURL.setUrlFPrice(price)%><%=SetURL.setUrlBrand(iBrand)%>">${c.name}</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                    <div class="filter-product">
                        <div class="filter-price">
                            <div class="title-filter">
                                <span>GIÁ</span>
                            </div>
                            <jsp:useBean id="filterPrice" scope="request" type="java.util.LinkedHashMap"/>
                            <c:forEach items="${filterPrice}" var="entry">
                                <div class="item-filter">
                                    <a class="${entry.key==filPrice ? "active":""}"
                                       href="productlist?<%=SetURL.setUrlSearch(search)%><%=SetURL.setUrlCa(cat)%>&price=${entry.key}<%=SetURL.setUrlBrand(iBrand)%>">${entry.value}</a>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="filter-brand">
                            <div class="title-filter">
                                <span>Thương hiệu</span>
                            </div>
                            <form class="filter-form" action="productlist" method="GET">
                                <c:if test="${search!=null}">
                                    <input type="hidden" name="search" value="<%=search%>"/>
                                </c:if>
                                <c:if test="${category!=null}">
                                    <input type="hidden" name="cid" value="<%=cat%>"/>
                                </c:if>
                                <c:if test="${filPrice!=null}">
                                    <input type="hidden" name="price" value="<%=price%>"/>
                                </c:if>

                                <c:forEach begin="0" end="${brand.size()-1}" var="b">
                                    <label class="ty-compact-list">
                                        <input class="test-compact" type="checkbox" name="ibrand"
                                               value="${brand.get(b).getId()}"
                                               onClick="this.form.submit()" ${isBrandCheck[b]?"checked":""}>
                                            ${brand.get(b).getName()}
                                    </label>
                                    <br/>
                                </c:forEach>
                            </form>
                            <div class="show-more">Show more</div>
                        </div>

                    </div>

                </div>
                <!-- /.sidenav-section -->
            </div>
            <div class="col-lg-10 col-md-9 col-sm-8 col-xs-12">
                <div class="row">
                    <div class="col-lg-8 alignleft" style="padding: 0">
                        <%--short product--%>
                        <div class="sort-list alignleft">
                            <ul class="content-sort">
                                <jsp:useBean id="sortProducts" scope="request" type="java.util.LinkedHashMap"/>
                                <c:forEach items="${sortProducts}" var="entry">
                                    <li><a class="${sorttype==entry.key ? "active" : ""}"
                                           href="productlist?<%=SetURL.setUrlSearch(search)%><%=SetURL.setUrlCa(cat)%><%=SetURL.setUrlFPrice(price)%><%=SetURL.setUrlBrand(iBrand)%>&sort=${entry.key}">${entry.value}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 alignleft" style="padding: 0">

                        <div class="search-text">
                            <c:if test="${search!=null}">
                                <h3>Kết quả tìm kiếm cho `${search}`
                                </h3>
                            </c:if>

                        </div>
                        <%--show item filter and then delete it--%>

                        <div class="filter-items">
                            <c:forEach items="${categorylist}" var="c">
                                <c:if test="${c.id==category}">
                                    <p class="item">${c.name}<a
                                            href="productlist?<%=SetURL.setUrlSearch(search)%><%=SetURL.setUrlFPrice(price)%><%=SetURL.setUrlBrand(iBrand)%>">
                                        <img src="https://salt.tikicdn.com/ts/upload/09/59/a4/a99bbc2a604f745281eca1aab8c87345.png"></a>
                                    </p>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${filterPrice}" var="entry">
                                <c:if test="${entry.key==filPrice}">
                                    <p class="item">${entry.value}<a
                                            href="productlist?<%=SetURL.setUrlSearch(search)%><%=SetURL.setUrlCa(cat)%><%=SetURL.setUrlBrand(iBrand)%>">
                                        <img src="https://salt.tikicdn.com/ts/upload/09/59/a4/a99bbc2a604f745281eca1aab8c87345.png"></a>
                                    </p>
                                </c:if>
                            </c:forEach>
                            <jsp:useBean id="brand" scope="request" type="java.util.List"/>
                            <c:forEach items="${brand}" var="b" varStatus="loop">
                                <c:if test="${isBrandCheck[loop.index]}">
                                    <c:url value="productlist" var="displayURL">
                                        <c:param name="1" value="1"/>
                                        <c:forEach items="${iBrand}" var="ib">
                                            <c:if test="${ib!=b.getId()}">
                                                <c:param name="ibrand" value="${ib}"/>
                                            </c:if>
                                        </c:forEach>
                                    </c:url>
                                    <p class="item">${b.getName()}<a
                                            href="<c:out value='${displayURL}' /><%=SetURL.setUrlSearch(search)%><%=SetURL.setUrlCa(cat)%><%=SetURL.setUrlFPrice(price)%>">
                                        <img src="https://salt.tikicdn.com/ts/upload/09/59/a4/a99bbc2a604f745281eca1aab8c87345.png"></a>
                                    </p>
                                </c:if>
                            </c:forEach>

                            <c:if test="${category!=null||filPrice!=null||iBrand!=null}">
                                <p class="item default"><a href="productlist?<%=SetURL.setUrlSearch(search)%>">Xóa tất
                                    cả</a></p>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="row" id="content">
                    <!-- product -->
                    <c:choose>
                        <c:when test="${fn:length(products)>0}">

                            <c:forEach var="p" items="${products}">
                                <div class="col-sm-3 m-0" style="padding: 2px;">
                                    <a href="productdetails?id=${p.id}">
                                        <div class="product-block">
                                            <div class="product-img"><img class="img-card" src="${p.imageUrl}" alt=""></div>
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
                                                    <button onclick="addToFavorite(this,${p.id},${sessionScope.account.id})"
                                                            class="product-btn btn-like ${FavoriteService.isExist(sessionScope.account.id,p.id)}">
                                                        <i class="fa fa-heart"></i></button>
                                                    <button class="product-btn btn-cart" onclick="addToCart(${p.id})">
                                                        <i class="fa fa-shopping-cart"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>

                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="none-product-error">
                                <span><i class="fas fa-exclamation-circle"></i> Rất tiếc, không tìm thấy sản phẩm phù hợp với lựa chọn của bạn</span>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <!-- /.product -->

                </div>
                <div class="row">
                    <!-- pagination start -->
                    <c:if test="${pages > 1}">
                        <div class="pagination">
                            <ul>
                                <c:if test="${index > 1}">
                                    <a href="<%=SetURL.setUrlAll(search,cat, price, sort, iBrand)%>&page=${index-1}">
                                        <li class="btn prev"><span><i class="fas fa-angle-left"></i>Prev</span>
                                        </li>
                                    </a>
                                </c:if>
                                <c:if test="${(index > 2)&&(pages>4)}">
                                    <a href="<%=SetURL.setUrlAll(search,cat, price, sort, iBrand)%>&page=${1}">
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
                                        <c:if test="${index == pages-1}">
                                            <% beforePage = beforePage - 1; %>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${index == 1}">
                                        <% afterPage = afterPage + 2; %>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${index == 2}">
                                            <% afterPage = afterPage + 1; %>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${pages == 2}">
                                    <% afterPage = 2; %>
                                    <% beforePage = 1; %>
                                </c:if>
                                <c:forEach begin="<%=beforePage%>" end="<%=afterPage%>" var="p">
                                    <c:if test="${(p > 0)&&(p< pages+1)}">
                                        <a href="<%=SetURL.setUrlAll(search,cat, price, sort, iBrand)%>&page=${p}">
                                            <li class="numb ${p==index?"active":""}"><span>${p}</span></li>
                                        </a>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${(index < pages-1)&&(pages>4)}">
                                    <c:if test="${index < pages-1}">
                                        <li class="dots"><span>...</span></li>
                                    </c:if>
                                    <a href="<%=SetURL.setUrlAll(search,cat, price, sort, iBrand)%>&page=${pages}">
                                        <li class="last numb"><span>${pages}</span></li>
                                    </a>
                                </c:if>
                                <c:if test="${index < pages}">
                                    <a href="<%=SetURL.setUrlAll(search,cat, price, sort, iBrand)%>&page=${index+1}">
                                        <li class="btn next"><span>Next<i
                                                class="fas fa-angle-right"></i></span></li>
                                    </a>
                                </c:if>
                            </ul>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.product-list -->
<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
<%--<script>--%>
<%--    function searchByName(param) {--%>
<%--        var texSearch = param.value;--%>
<%--        $.ajax({--%>
<%--            url: "/searchAjax",--%>
<%--            type: "get",--%>
<%--            data: {--%>
<%--                search: texSearch--%>
<%--            },--%>
<%--            success: function (data) {--%>
<%--                var row = document.getElementById("content");--%>
<%--                row.innerHTML = data;--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
<script>
    $(document).ready(function () {
        if ($('.ty-compact-list').length > 10) {
            $('.ty-compact-list:gt(9)').hide();
            $('.show-more').show();
        }

        $('.show-more').on('click', function () {
            //toggle elements with class .ty-compact-list that their index is bigger than 2
            $('.ty-compact-list:gt(9)').toggle();

            //change text of show more element just for demonstration purposes to this demo
            if ($(this).text() === 'Show more') {
                $(this).text('Show less')
                $('.filter-form').css('height', "auto");
            } else {
                $(this).text('Show more');
                $('.filter-form').css('height', "350px");
            }
        });
    })
</script>
</body>


</html>