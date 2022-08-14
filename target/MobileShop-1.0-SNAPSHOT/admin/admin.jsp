<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>

<head>
    <jsp:include page="/admin/sub-component/header-admin.jsp"/>
    <title></title>
</head>

<body>
<div class="d-flex" id="wrapper">

    <jsp:include page="/admin/sub-component/menu-admin.jsp"/>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

        <jsp:include page="/admin/sub-component/top-menu-admin.jsp"/>

        <div class="container-fluid">
            <div class="mb-5 mt-3 ">
                <h4 class=" mt-3 mb-3">Bảng tính tổng</h4>
                <div class="summary-content">
                    <div class="summary-item">
                        <span class="name-description">Tổng doanh thu</span>
                        <h3 class="value">
                            <fmt:formatNumber value="${totalIncome}"/>
                        </h3>
                    </div>
                    <div class="summary-item">
                        <span class="name-description">Số đơn hàng</span>
                        <h3 class="value">${totalOrder}</h3>
                    </div>
                    <div class="summary-item">
                        <span class="name-description">Sản phẩm đã bán</span>
                        <h3 class="value">${soldProduct}</h3>
                    </div>
                    <div class="summary-item">
                        <span class="name-description">Sản phẩm tồn kho</span>
                        <h3 class="value">${restProduct}</h3>
                    </div>
                    <div class="summary-item">
                        <span class="name-description">Lượt truy cập</span>
                        <h3 class="value">0</h3>
                    </div>
                </div>

            </div>
            <div class="border mb-2">
                <h4 class="text-center mt-3 mb-4">Bảng thống kê bán hàng</h4>
                <div class="row">
                    <div class="show-page mb-3 ml-3">
                        Hiển thị
                        <select id="show-row" onclick="select_page()">
                            <option value="10">
                                10 dòng
                            </option>
                            <option value="20">
                                20 dòng
                            </option>
                            <option value="50">
                                50 dòng
                            </option>
                        </select>
                    </div>
                    <div class="show-page arrange">
                        <input id="myInput" type="text" class="input-form" placeholder="Tìm kiếm">
                    </div>
                </div>
                <table class="table table-hover table-text-center">
                    <thead class="thead-light">
                    <tr>
                        <th scope="col">Thời gian</th>
                        <th scope="col">Doanh thu</th>
                        <th scope="col" data-toggle="tooltip" data-placement="top"
                            title="Số lượng sản phẩm được thêm"><span
                                title="Số lượng sản phẩm"> SLSP</span> bán được
                        </th>
                        <th scope="col" data-toggle="tooltip" data-placement="top"
                            title="Số lượng sản phẩm tồn kho"><span
                                title="Số lượng sản phẩm"> SLSP</span> được thêm
                        </th>
                        <th scope="col">Số lượng tồn kho</th>
                        <th scope="col">Số lượng truy cập</th>
                    </tr>
                    </thead>
                    <tbody id="content-table">
                    <tr>
                        <th scope="row">9/2020</th>
                        <td>30,000,00</td>
                        <td>4</td>
                        <td>2</td>
                        <td>42</td>
                        <td>400</td>
                    </tr>
                    <tr>
                        <th scope="row">8/2020</th>
                        <td>24,000,00</td>
                        <td>3</td>
                        <td>4</td>
                        <td>46</td>
                        <td>200</td>
                    </tr>
                    <tr>
                        <th scope="row">7/2020</th>
                        <td>12,000,00</td>
                        <td>2</td>
                        <td>5</td>
                        <td>49</td>
                        <td>502</td>
                    </tr>
                    <tr>
                        <th scope="row">6/2020</th>
                        <td>22,000,00</td>
                        <td>7</td>
                        <td>2</td>
                        <td>51</td>
                        <td>420</td>
                    </tr>
                    <tr>
                        <th scope="row">5/2020</th>
                        <td>30,000,00</td>
                        <td>5</td>
                        <td>8</td>
                        <td>58</td>
                        <td>492</td>
                    </tr>
                    <tr>
                        <th scope="row">4/2020</th>
                        <td>25,000,00</td>
                        <td>2</td>
                        <td>4</td>
                        <td>63</td>
                        <td>100</td>
                    </tr>


                    </tbody>
                </table>

            </div>
            <div class="page-navigation">
                <div class="beta">
                    <button onclick="previous_page()"> Trước</button>
                    <span id="page-number">
            </span>
                    <button onclick="next_page()"> Sau</button>
                </div>
            </div>

        </div>
    </div>
    <!-- /#page-content-wrapper -->
</div>
<script src="<c:url value="/assets/js/js_admin/divide-page.js"/>"></script>
<!-- Menu Toggle Script -->
<script>
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

</script>

<!-- search -->
<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#content-table tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

    $(document).ready(function () {
        $('.list-group-item').click(function () {
            $('.list-group-item').removeClass('active');
            $(this).addClass('active');
        });
    });
</script>

<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

</body>

</html>