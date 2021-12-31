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
<!-- page-header -->

<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li><a href="#">Trang chủ</a></li>
                        <li>Chi tiết sản phẩm</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.page-header-->
<!-- product-single -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box">
                    <!-- product-description -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                <ul id="demo1_thumbs" class="slideshow_thumbs">
                                    <li>
                                        <a
                                                href="https://www.xtmobile.vn/vnt_upload/product/10_2021/thumbs/600_iphone_13_256gb_xanh.jpg">
                                            <div class=" thumb-img"><img
                                                    src="https://www.xtmobile.vn/vnt_upload/product/10_2021/thumbs/600_iphone_13_256gb_xanh.jpg"
                                                    alt=""></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://www.xtmobile.vn/vnt_upload/product/10_2021/thumbs/600_iphone_13_256gb_trang.jpg">
                                            <div class=" thumb-img"><img
                                                    src="https://www.xtmobile.vn/vnt_upload/product/10_2021/thumbs/600_iphone_13_256gb_trang.jpg"
                                                    alt=""></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://www.xtmobile.vn/vnt_upload/product/10_2021/thumbs/600_iphone_13_256gb_hong.jpg"
                                           alt="">
                                            <div class=" thumb-img"><img
                                                    src="https://www.xtmobile.vn/vnt_upload/product/10_2021/thumbs/600_iphone_13_256gb_hong.jpg"
                                                    alt=""></div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div id="slideshow"></div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="product-single">
                                    <h2>iPhone 13 256GB Chính hãng (VN/A)</h2>
                                    <div class="product-rating">
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star-o"></i></span>
                                        <span class="text-secondary">&nbsp;(12 đánh giá)</span>
                                    </div>
                                    <p class="product-price" style="font-size: 25px;">25.350.000đ<strike
                                            style="color:rgba(128, 128, 128, 0.658); font-size: 18px;">
                                        27.990.000đ</strike>
                                    </p>
                                    <div class="box-capacity">
                                        <a href="">
                                            <span class="capacity">128GB</span>

                                        </a>

                                        <a href="" class="current-phone">
                                            <span class="capacity">256GB</span>

                                        </a>

                                        <a href="">
                                            <span class="capacity">512GB</span>

                                        </a>
                                    </div>

                                    <div class="color-phone">
                                        <a href="" class="current-color">
                                            <span>Vàng đồng</span>
                                        </a>
                                        <a href="">
                                            <span>Xám</span>
                                        </a>
                                        <a href="">
                                            <span>Bạc</span>
                                        </a>
                                    </div>
                                    <div class="product-quantity">
                                        <h4>Số lượng</h4>
                                        <div class="quantity mb20">
                                            <button class="btn-quantity decrease-quantity" type="button">-</button>
                                            <input type="number" max="5" min="1" name="quantity" value="1"
                                                   class="quantity-input">
                                            <button class="btn-quantity increase-quantity" type="button">+</button>
                                        </div>
                                        <span class="rest-quantity">5 sản phẩm có sẵn</span>
                                    </div>
                                    <div>
                                        <button class="btn btn-default btn-buy-now">
                                            Mua Ngay
                                        </button>
                                        <button type="submit" class="btn btn-default">
                                            <i class="fa fa-shopping-cart"></i>&nbsp;Thêm vào giỏ hàng
                                        </button>

                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box-head scroll-nav">
                    <div class="head-title">
                        <a class="page-scroll active" href="#product">Mô tả sản phẩm</a>
                        <a class="page-scroll" href="#rating">Đánh giá và nhận xét</a>
                        <a class="page-scroll" href="#review">Thêm nhận xét</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- highlights -->
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="description-details">
                    <div class="description-left">
                        <h2 class="dgctpro">Đặc điểm nổi bật</h2>
                        <div itemprop="description" class="content_hide content-desc" style="height: 1180px;">
                            <h2><a href="https://www.xtmobile.vn/iphone-13-128gb" target="_blank"><span
                                    style="color: rgb(0, 0, 205);">iPhone 13 128GB</span></a>&nbsp;gây
                                ấn tượng với thiết kế sang trọng, cấu hình mạnh mẽ với chip A15
                                Bionic, dung lượng lớn, camera độc đáo. Đây là một trong những lý do
                                khiến người dùng không nên bỏ qua&nbsp;<a
                                        href="https://www.xtmobile.vn/iphone-13" target="_blank"><span
                                        style="color: rgb(0, 0, 205);">iPhone 13</span></a>&nbsp;series
                                trong năm nay.</h2>

                            <h3>Thiết kế cao cấp, sang trọng</h3>

                            <p>Đánh giá iPhone 13 128GB cho thấy ngoại hình máy không có nhiều khác
                                biệt so với iPhone 12. Apple tiếp tục sử dụng cạnh viền vát phẳng mang
                                đến sự nam tính và mạnh mẽ. Phần thân máy siêu mỏng, kết hợp với
                                mặt kính cường lực bóng bẩy và khung nhôm chắc chắn mang đến độ bền
                                tốt hơn.</p>

                            <p style="text-align: center;"><img alt="thiet-ke-iphone-13-128gb-xtmobile"
                                                                src="https://www.xtmobile.vn/vnt_upload/product/10_2021/thiet-ke-iphone-13-128gb-xtmobile.jpg"
                                                                style="width: 680px; height: 510px;"></p>

                            <p>Để trang bị viên pin lớn hơn cho dòng iPhone 13, "Táo khuyết" sẽ tăng độ
                                dày của máy lên thêm khoảng 0,26mm. Mặt trước máy vẫn sử dụng notch
                                tai thỏ đặt trưng, tuy nhiên kích thước có phần nhỏ gọn hơn thế hệ
                                trước. Trong khi đó, mặt sau được thay đổi cách sắp xếp camera giúp
                                người dùng dễ dàng phân biệt giữa iPhone 13 và iPhone 12.</p>

                            <p>Nếu như iPhone 12 sở hữu mô-đun camera hình vuông với ống kính xếp dọc
                                thì trên iPhone 13 128GB giá rẻ được sắp xếp theo đường chéo. Bên cạnh
                                đó, cụm camera cũng có phần to và lồi hơn. Thế hệ iPhone 2021 ra mắt
                                năm này được Apple bổ sung khá nhiều màu sắc mới mẻ, giúp người dùng
                                có nhiều lựa chọn hơn.</p>

                            <h3>Màn hình hiển thị chất lượng</h3>

                            <p>Màn hình iPhone 13 128GB không có nhiều nâng cấp so với các model iPhone
                                13 Pro và iPhone 13 Pro Max. Theo đó, máy vẫn sử dụng tấm nền OLED cao
                                cấp với kích thước 6,1 inch và độ phân giải Full HD+. Mặc dù chỉ được
                                hỗ trợ tốc độ làm mới 60Hz tiêu chuẩn, nhưng chất lượng hiển thị
                                cũng được đánh giá cao với màu sắc rực rỡ, hình ảnh tái hiện một
                                cách chân thật.</p>

                            <p style="text-align: center;"><img
                                    alt="Màn hình iPhone 13 128GB không có nhiều nâng cấp"
                                    src="https://www.xtmobile.vn/vnt_upload/product/10_2021/man-hinh-iphone-13-128gb-xtmobile.jpg"
                                    style="width: 680px; height: 510px;"></p>

                            <p>Điều này chắc chắn đáp ứng tốt nhu cầu trải nghiệm người dùng từ xem
                                phim, chơi game, lướt web...Công nghệ bảo mật nhận diện khuôn mặt - Face
                                ID sẽ nhận được một vài nâng cấp đáng chú ý, cho phép nhận diện ở
                                nhiều góc độ và tốc độ phản hồi nhanh hơn.</p>

                            <h3>Cấu hình iPhone 13 128GB vượt trội
                            </h3>

                            <p>Sự xuất hiện của chip A15 Bionic chắc chắn sẽ mang đến hiệu năng cực
                                kỳ tốt cho iPhone 13 128GB. Chipset này được sản xuất trên tiến trình
                                5nm+ của TSMC, hứa hẹn mang đến hiệu suất hoạt động tốt và tiết kiệm
                                điện năng hơn so với A14 Bionic trên iPhone 12. Chính vì vậy, mua iPhone 13
                                chính hãng giá rẻ sẽ mang đến cấu hình vượt trội, đa nhiệm mượt mà.
                            </p>

                            <p style="text-align: center;"><img
                                    alt="Sự xuất hiện của chip A15 Bionic chắc chắn sẽ mang đến hiệu năng cực kỳ tốt cho iPhone 13 128GB"
                                    src="https://www.xtmobile.vn/vnt_upload/product/10_2021/camera-iphone-13-128gb-xtmobile.jpg"
                                    style="width: 680px; height: 510px;"></p>

                            <p>Bộ nhớ lưu trữ trên iPhone 13 không có nhiều nâng cấp so với thế hệ
                                trước. Thiết bị vẫn chỉ đi kèm với bộ nhớ RAM 4GB và bộ nhớ trong
                                128GB. Nhìn chung, dung lượng bộ nhớ này có thể đáp ứng tốt việc lưu
                                trữ cũng như hỗ trợ đa nhiệm mượt mà cho người dùng. Tất nhiên, Apple
                                cũng sẽ mang đến khả năng kết nối 5G ấn tượng cho loạt iPhone mới với
                                nhiều tiện ích hơn.</p>

                            <p>Ngoài sở hữu cấu hình mạnh mẽ, loạt iPhone mới còn được Apple trang
                                bị viên pin lớn hơn hứa hẹn mang đến thời lượng sử dụng cải thiện
                                đáng kể cho người dùng.&nbsp;<span style="text-align: center;">&nbsp;Bên
                                        cạnh đó, điện thoại cũng sẽ được cải tiến pin thông qua việc
                                        triển khai lại bảng mạch pin và phụ kiện sạc linh hoạt mới.</span>
                            </p>

                        </div>
                        <button class="less-evaluation text-center" style="display:none"><i
                                class="fa fa-minus-circle"></i> Rút gọn
                        </button>
                        <button class="more-evaluation text-center"><i class="fa fa-plus-circle"></i> Xem
                            thêm
                        </button>

                    </div>
                    <div class="description-right">
                        <h2 class="dgctpro">Thông số kĩ thuật</h2>
                        <table class="charactestic_table">
                            <tbody>
                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Hệ điều hành:
                                </td>
                                <td class="content_charactestic">
                                    iOS 15
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Màn hình:
                                </td>
                                <td class="content_charactestic">
                                    Super Retina XDR OLED, 120Hz, HDR10, Dolby Vision, 1000 nits (typ), 1200
                                    nits (peak)
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Mặt kính cảm ứng:
                                </td>
                                <td class="content_charactestic">
                                    Gorilla Glass
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Màn hình rộng:
                                </td>
                                <td class="content_charactestic">
                                    6.1 inch (chiếm khoảng 86.0% thân máy)
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Độ phân giải:
                                </td>
                                <td class="content_charactestic">
                                    1170 x 2532 pixels, 19.5:9
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Ram:
                                </td>
                                <td class="content_charactestic">
                                    6GB
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Bộ nhớ trong:
                                </td>
                                <td class="content_charactestic">
                                    128GB
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    CPU:
                                </td>
                                <td class="content_charactestic">
                                    Apple A15 Bionic (5 nm) 6 nhân
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Chip đồ họa (GPU):
                                </td>
                                <td class="content_charactestic">
                                    Apple GPU (5 nhân)
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Camera Sau:
                                </td>
                                <td class="content_charactestic">
                                    12 MP, f/1.5, 26mm (wide), 1.9µm, dual pixel PDAF, sensor-shift
                                    stabilization (IBIS) 12 MP, f/2.8, 77mm (telephoto), PDAF, OIS, 3x optical
                                    zoom 12 MP, f/1.8, 120˚, 13mm (ultrawide), PDAF
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Camera trước:
                                </td>
                                <td class="content_charactestic">
                                    12 MP, f/2.2, 23mm (wide), 1/3.6"
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Thẻ sim:
                                </td>
                                <td class="content_charactestic">
                                    1 SIM (Nano-SIM và/hoặc eSIM) hoặc 2 SIM (2 Nano-SIM)
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Thẻ nhớ ngoài:
                                </td>
                                <td class="content_charactestic">
                                    Không
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Dung lượng pin:
                                </td>
                                <td class="content_charactestic">
                                    Sạc nhanh 20W, đầy 50% trong 30 phút
                                </td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">
                                    Màu sắc:
                                </td>
                                <td class="content_charactestic">
                                    Than Chì, Vàng, Bạc, Xanh Sierra
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- rating reviews  -->
        <div id="rating">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <div class="box container-rating-review">
                        <div class="box-head">
                            <h3 class="head-title">Đánh giá và nhận xét</h3>
                        </div>
                        <div class="box-body">
                            <div class="row  rating-box">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="rating-review">
                                        <div class="">
                                            <h1 class="score-rating">4</h1>
                                        </div>
                                        <div>
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <p class="text-secondary">12 nhận xét</p>
                                        </div>
                                    </div>
                                    <div class="rating-view-details">
                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </div>
                                            <span>12</span>
                                        </div>

                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <span>0</span>
                                        </div>
                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <span>0</span>
                                        </div>

                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <span>0</span>
                                        </div>
                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <span>0</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row review-box">
                                <div class="customer-reviews">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <p class="reviews-text"><span class="text-default">Nika Nguyen</span></p>
                                        <div class="product-rating">
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                        </div>
                                        <p>Giao hàng siêu đúng hẹn, hàng cũng được đóng gói cẩn thận.
                                            Hiện tại mình xài được vài bữa thì không bị vấn đề gì.
                                            Hàng của shopdunk thì không lo về chất lượng.</p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="divider-line"></div>
                                    </div>
                                </div>
                                <div class="customer-reviews">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <p class="reviews-text"><span class="text-default">Lưu Tee</span>
                                        </p>
                                        <div class="product-rating">
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                        </div>

                                        <p>Mặc dù vận chuyển lâu do lỗi, nhưng shop vẫn hỗ trợ mình rất nhiệt tình
                                        </p>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="divider-line"></div>
                                    </div>
                                </div>
                                <div class="customer-reviews">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <p class="reviews-text"> <span class="text-default">William
                                                    Cassidy</span>
                                        </p>
                                        <div class="product-rating">
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                        </div>

                                        <p>Sản phẩm rất tốt vì là lần đầu tôi mua trên mạng đt nên thấy khá là lo
                                            lắng nhưng khi nhận đc hàng thì tôi lại thấy tốt hơn mong đợi của mình
                                            chúc Shop làm ăn mua may bán đắt</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <div id="review">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="box">
                            <div class="box-head">
                                <h3 class="head-title">Đánh giá và nhận xét của bạn</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="review-form">

                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 review-left">
                                            <div class="review-rating">
                                                <h4>Đánh giá của bạn về sản phẩm này</h4><br/>
                                                <div class="star-rate" id="rateYo"></div>
                                            </div>
                                        </div>
                                        <form class="review-right">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label sr-only " for="name"></label>
                                                    <input id="name" type="text" class="form-control"
                                                           placeholder="Họ tên" required="">
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label sr-only " for="email"></label>
                                                    <input id="email" type="text" class="form-control"
                                                           placeholder="Email" required="">
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label sr-only " for="textarea"></label>
                                                    <textarea class="form-control" id="textarea" name="textarea"
                                                              rows="4" placeholder="Mời bạn nhập bình luận"></textarea>
                                                </div>
                                                <button id="submit" name="singlebutton" class="btn btn-primary">Gửi
                                                    đánh giá
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.reviews-form -->

        </div>


    </div>
    <!-- /.product-description -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box-head">
                    <h3 class="head-title">Sản phẩm liên quan</h3>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-body">
                <div class="row">
                    <!-- product -->
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img"><img src="../assets/images/product_img_1.png" alt=""></div>
                            <div class="product-content">
                                <h5><a href="#" class="product-title">Google Pixel <strong>(128GB,
                                    Black)</strong></a></h5>
                                <div class="product-meta"><a href="#" class="product-price">$1100</a>
                                    <a href="#" class="discounted-price">$1400</a>
                                    <span class="offer-price">20%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                    <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.product -->
                    <!-- product -->
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img"><img src="../assets/images/product_img_2.png" alt=""></div>
                            <div class="product-content">
                                <h5><a href="#" class="product-title">HTC U Ultra <strong>(64GB, Blue)</strong></a>
                                </h5>
                                <div class="product-meta"><a href="#" class="product-price">$1200</a>
                                    <a href="#" class="discounted-price">$1700</a>
                                    <span class="offer-price">10%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                    <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.product -->
                    <!-- product -->
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img"><img src="../assets/images/product_img_3.png" alt=""></div>
                            <div class="product-content">
                                <h5><a href="#" class="product-title">Samsung Galaxy Note 8</a></h5>
                                <div class="product-meta"><a href="#" class="product-price">$1500</a>
                                    <a href="#" class="discounted-price">$2000</a>
                                    <span class="offer-price">40%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                    <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.product -->
                    <!-- product -->
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img"><img src="../assets/images/product_img_4.png" alt=""></div>
                            <div class="product-content">
                                <h5><a href="#" class="product-title">Vivo V5 Plus <strong>(Matte
                                    Black)</strong></a></h5>
                                <div class="product-meta"><a href="#" class="product-price">$1500</a>
                                    <a href="#" class="discounted-price">$2000</a>
                                    <span class="offer-price">15%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like">
                                        <i class="fa fa-heart"></i></a>
                                    <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.product -->
                </div>
            </div>
        </div>
    </div>
    <!-- /.product-single -->
</div>
<!-- footer -->
<jsp:include page="/sub-component/footer.jsp"/>

<script type="text/javascript" src="<c:url value="/assets/js/quantity-product.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/js/product-single.js"/>"></script>

</body>

</html>