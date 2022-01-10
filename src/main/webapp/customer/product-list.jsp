
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
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
<% String cat = (String) request.getAttribute("category");%>
<% String sort = (String) request.getAttribute("sorttype");%>

<%! String setUrtSort(String s){
    if(s==null) {
        return "";
    }else{
        return "&sort="+s;
    }
}
%>
<%! String setUrl(String category){
        if(category==null) {
            return "";
        }else{
            return "cid="+category;
        }
    }
%>
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
    <div class="container cont-product-list">
        <div class="row div-content">
            <div class="menu">
                <div id='cssmenu'>
                    <table>
                        <tr>
                            <th>Category</th>
                        </tr>
                        <c:forEach items="${categorylist}" var="c">

                            <tr>
                                <td class="${c.id==category?"active":""}"><a href="ProductList?cid=${c.id}">${c.name}</a></td>
                            </tr>
                        </c:forEach>


                    </table>
                </div>
                <!-- /.sidenav-section -->
            </div>
            <div class="col-lg-10 col-md-9 col-sm-8 col-xs-12">
                <div class="row">
                    <div class="col-lg-8 alignleft mb10" style="padding: 0">
                        <form>
                            <div class="sort-list alignleft">
                                <ul class="content-sort">
                                    <li><a class="${sorttype.equals("top_seller") ? "active" : ""}" href="ProductList?<%=setUrl(cat)%>&sort=top_seller">Bán Chạy</a></li>
                                    <li><a class="${sorttype.equals("price_asc") ? "active" : ""}" href="ProductList?<%=setUrl(cat)%>&sort=price_asc">Giá Thấp</a></li>
                                    <li><a class="${sorttype.equals("price_desc") ? "active" : ""}" href="ProductList?<%=setUrl(cat)%>&sort=price_desc">Giá Cao</a></li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <!-- product -->
                    <jsp:useBean id="products" scope="request" type="java.util.List"/>
                    <c:forEach var="p" items="${products}">
                        <div class="col-sm-3 m-0" style="padding: 2px;">
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
                                <a href="ProductList?<%=setUrl(cat)%><%=setUrtSort(sort)%>&page=${index-1}">
                                    <li class="btn prev"><span><i class="fas fa-angle-left"></i>Prev</span>
                                    </li>
                                </a>
                            </c:if>
                            <c:if test="${(index > 2)&&(pages>4)}">
                                <a href="ProductList?<%=setUrl(cat)%><%=setUrtSort(sort)%>&page=${1}">
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
                                            <a href="ProductList?<%=setUrl(cat)%><%=setUrtSort(sort)%>&page=${p}">
                                                <li class="numb active"><span>${p}</span></li>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="ProductList?<%=setUrl(cat)%><%=setUrtSort(sort)%>&page=${p}">
                                                <li class="numb"><span>${p}</span></li>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>

                            <c:if test="${(index < pages-1)&&(pages>4)}">
                                <c:if test="${index < pages-1}">
                                    <li class="dots"><span>...</span></li>
                                </c:if>
                                <a href="ProductList?<%=setUrl(cat)%><%=setUrtSort(sort)%>&page=${pages}">
                                    <li class="last numb"><span>${pages}</span></li>
                                </a>
                            </c:if>
                            <c:if test="${index < pages}">
                                <a href="ProductList?<%=setUrl(cat)%><%=setUrtSort(sort)%>&page=${index+1}">
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

</body>

</html>