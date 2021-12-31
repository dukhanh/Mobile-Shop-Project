<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>
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
                            <h2 class="head-title">Thông tin của bạn</h2>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <form>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="name"></label>
                                            <input name="name" type="text" class="form-control"
                                                placeholder="Họ" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="name"></label>
                                            <input id="name" name="name" type="text" class="form-control"
                                                placeholder="Tên" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="email">Email</label>
                                            <input id="email" name="email" type="text" class="form-control"
                                                placeholder="Email address" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="phone"></label>
                                            <input id="phone" name="phone" type="text" class="form-control"
                                                placeholder="Phone" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only"> </label>
                                            <select name="country name" class="form-control" required>
                                                <option value="">Việt Nam</option>
                                                <option value="1">United Kingdom</option>
                                                <option value="2">United States of America</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only"></label>
                                            <input name="phone" type="text" class="form-control"
                                                placeholder="Địa chỉ" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only"></label>
                                            <input name="postcode" type="text" class="form-control"
                                                placeholder="Mã khuyến mãi" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="textarea"></label>
                                            <textarea class="form-control" id="textarea" name="textarea" rows="4"
                                                placeholder="Ghi chú"></textarea>
                                        </div>
                                        <button class="btn btn-primary ">Xác nhận thanh toán</button>
                                        <div class="checkbox alignright mt20">
                                            <label>
                                                <input type="checkbox" value="">
                                                <span>Đăng kí tài khoản?</span>
                                            </label>
                                        </div>
                                    </div>
                                </form>
                                <!-- /.checkout-form -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- product total -->
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="box mb30">
                        <div class="box-head">
                            <h3 class="head-title">Đơn hàng của bạn</h3>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <!-- product total -->

                                <div class="pay-amount ">
                                    <table class="table mb20">
                                        <thead class=""
                                            style="border-bottom: 1px solid #e8ecf0;  text-transform: uppercase;">
                                            <tr>
                                                <th>
                                                    <span>Sản phẩm</span>
                                                </th>
                                                <th>
                                                    <span>Giá tiền</span>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <span>Google Pixle X 1</span>
                                                </th>
                                                <td>$2400</td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>Apple iPhone 6S X 1 </span>
                                                </th>
                                                <td>$1300</td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>Sub Total </span>
                                                </th>
                                                <td>$2400</td>
                                            </tr>
                                        </tbody>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <span>Tổng thanh toán</span>
                                                </th>
                                                <td>$2400</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.product total -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>
</body>


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/checkout.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:04 GMT -->

</html>