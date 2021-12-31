<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 12/29/2021
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                    <a href="<c:url value="../customer/index.jsp"/>"><img src="/assets/images/logo.png" alt=""> </a>
                </div>
            </div>
            <!-- /.logo -->
            <!-- search -->
            <div class="col-lg-5 col-md-6 col-sm-6 col-xs-6">
                <div class="search-bg">
                    <input type="text" class="form-control" placeholder="Search Here">
                    <button type="Submit"><i class="fa fa-search"></i></button>
                </div>
            </div>
            <!-- /.search -->
            <!-- account -->
            <div class="col-lg-4 col-md-3 col-sm-3 col-xs-12">
                <div class="account-section">
                    <ul>
                        <li><a href="<c:url value="../customer/account.jsp"/>" class="title hidden-xs">Tài khoản</a></li>
                        <li class="hidden-xs">|</li>
                        <li><a href="../customer/login-form.jsp" class="title hidden-xs">Đăng nhập</a></li>
                        <li><a href="../customer/favorite-list.jsp"><i class="fa fa-heart"></i><sup
                                class="cart-quantity">2</sup></a></li>
                        <li><a href="../customer/cart.jsp" class="title"><i class="fa fa-shopping-cart"></i> <sup
                                class="cart-quantity">2</sup></a>
                        </li>
                    </ul>
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
                            <li class="active"><a href="<c:url value="../customer/index.jsp"/>">Trang chủ</a></li>
                            <li><a href="../customer/product-list.jsp">Điện thoại</a>
                            </li>
                            <li><a href="<c:url value="../customer/about.jsp"/>">Thông tin</a>
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
