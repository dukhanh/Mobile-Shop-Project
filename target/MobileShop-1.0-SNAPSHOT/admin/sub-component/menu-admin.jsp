<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 12/30/2021
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../sub-component/taglib.jsp" %>
<div class="side-bar bg-light border-right" id="sidebar-wrapper">
    <div class="sidebar-heading text-center"><b>Mobile Shop</b></div>
    <div class="profile">
        <div class="profile-pic">
            <img src="<c:url value="/assets/images/user_img_1.jpg"/>" alt="">
        </div>
        <div class="profile-info">
            <span>Welcome</span>
            <h5>${sessionScope.account.fullName}</h5>
        </div>
    </div>
    <div class="list-group list-group-flush">
        <ul id="navigation">
            <li>
                <a href="../admin/admin.jsp" class="list-group-item list-group-item-action"> Trang chủ <i
                        class="menu-icon fa fa-laptop"></i></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/dataUser" class="list-group-item list-group-item-action">
                    Thông tin người dùng<i class="menu-icon fas fa-users font-list"></i>
                </a>
            </li>
            <li>
                <a href="../admin/dataProduct.jsp" class="list-group-item list-group-item-action  "> Thông tin sản phẩm
                    <i class="menu-icon fas fa-mobile-alt font-list"></i></a>
            </li>
            <li>
                <a href="../admin/admin-manager-recipt.jsp" class="list-group-item list-group-item-action "> Quản lí đơn
                    hàng <i
                            class="menu-icon fas fa-shopping-cart font-list"></i></a>
            </li>
            <li>
                <a href="../admin/admin-branch.jsp" class="list-group-item list-group-item-action "> Thông
                    tin
                    thương hiệu <i class="menu-icon fas fa-archway"></i></a>
            </li>
            <li>
                <a href="../admin/admin-cancel-receipt.jsp" class="list-group-item list-group-item-action"> Đơn
                    hàng bị hủy <i class="menu-icon fas fa-phone-slash"></i></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/feedback" class="list-group-item list-group-item-action"> Phản hồi khách hàng
                    <i class="menu-icon far fa-paper-plane"></i>
                </a>
            </li>
            <!-- <li>
              <a href="admin-filter.html" class="list-group-item list-group-item-action "> Dữ liệu lọc <i
                  class="menu-icon fas fa-filter"></i></a>
            </li> -->
        </ul>
    </div>
</div>


