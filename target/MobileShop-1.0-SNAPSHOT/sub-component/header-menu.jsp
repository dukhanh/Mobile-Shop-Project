<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 12/29/2021
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="taglib.jsp" %>
<div class="top-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-7 col-sm-6 hidden-xs">
                <p class="top-text">Flexible Delivery, Fast Delivery.</p>
            </div>
            <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12">
                <ul>
                    <li>+084 123 4567</li>
                    <li>nhom21@laptrinhweb.com</li>
                </ul>
            </div>
        </div>
        <!-- /.top-header-->
    </div>
</div>
<!-- header-section-->
<div class="header-wrapper">
    <div class="container">
        <div class="row">
            <!-- logo -->
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-8">
                <div class="logo">
                    <a href="<c:url value="/home"/>"><img src="/assets/images/logo.png" alt=""> </a>
                </div>
            </div>
            <!-- /.logo -->
            <!-- search -->
            <div class="col-lg-5 col-md-6 col-sm-6 col-xs-6">
                <div class="search-bg">
                    <form action="productlist" method="get">
                        <input type="text" name="search" class="form-control" value="${search}"
                               placeholder="Search Here">
                        <button type="Submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>
            <!-- /.search -->
            <!-- account -->
            <div class="col-lg-4 col-md-3 col-sm-3 col-xs-12">
                <div class="account-section">
                    <ul>
<%--                        <li><a href="${pageContext.request.contextPath}/favorite_product"><i class="fa fa-heart"></i>--%>
<%--                            <c:if test="${sessionScope.amountFavorites!=null}">--%>
<%--                                <sup class="cart-quantity">${sessionScope.amountFavorites}</sup>--%>
<%--                            </c:if>--%>
<%--                        </a></li>--%>
                        <li><a href="../customer/cart.jsp" class="title"><i class="fa fa-shopping-cart"></i>
                            <sup
                                    class="cart-quantity">2</sup></a>
                        </li>
                    </ul>
                    <%--                    khi da dang nhap--%>
                    <c:if test="${sessionScope.account!=null}">
                        <div class="account-login" onclick="myFunction()">
                            <div class="account-name">
                                <i class="far fa-user"></i>
                                <div>
                                    <p class="title-user">Tài khoản</p>
                                    <p class="user-name">${sessionScope.account.fullName}</p>
                                </div>
                            </div>
                            <i class="fa fa-caret-down"></i>
                            <div class="drop-down-account" id='myDIV'>
                                <ul>
                                    <a href="${pageContext.request.contextPath}/customer/profile-account.jsp">
                                        <li>Tài khoản của tôi</li>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/customer/profile-receipt.jsp">
                                        <li>Đơn hàng của tôi</li>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/favorite_product">
                                        <li>Sản phẩm yêu thích</li>
                                    </a>
                                    <c:if test="${(sessionScope.account.role).equals('admin')}">
                                        <a href="../admin/admin.jsp">
                                            <li>Trang admin</li>
                                        </a>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/logout">
                                        <li>Đăng xuất</li>
                                    </a>
                                </ul>
                            </div>
                        </div>
                    </c:if>
                    <%--                    khi chua dang nhap--%>
                    <c:if test="${sessionScope.account==null}">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/account/send-code-register.jsp"
                                   class="title hidden-xs">Đăng ký</a>
                            </li>
                            <li class="hidden-xs">|</li>
                            <li><a href="${pageContext.request.contextPath}/login"
                                   class="title hidden-xs">Đăng nhập</a></li>
                        </ul>
                    </c:if>
                </div>
                <!-- /.account -->
            </div>
            <!-- search -->
        </div>
    </div>
    <!-- navigation -->
    <div class="navigation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <!-- navigations-->
                    <div id="navigation">
                        <ul>
                            <li class="active"><a href="${pageContext.request.contextPath}/home">Trang chủ</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/productlist">Điện thoại</a>
                            </li>
                            <li><a href="<c:url value="/customer/about.jsp"/>">Thông tin</a>
                            </li>
                            <li><a href="../customer/blog-default.jsp">Bài viết</a></li>
                            <li><a href="../customer/contact-us.jsp">Liên hệ, hỗ trợ</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.navigations-->
            </div>
        </div>
    </div>
</div>

<script>
    function myFunction() {
        var x = document.getElementById("myDIV");
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
</script>