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
<!-- /. header-section-->
<!-- page-header -->
<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <div class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li><a href="#">Trang chủ</a></li>
                        <li>Blog Single</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- /.page-header-->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                <div class="row">
                    <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                        <div class="post-block ">
                            <!-- post block -->
                            <div class="post-content">
                                <h2 class="post-title">${blog.title}</h2>
                                <div class="meta">
                                    <span class="meta-date">${blog.createDate}</span>
                                    <span>| &nbsp; &nbsp;</span>
                                    <span class="meta-admin">By <a href="#" class="meta-title">${blog.createBy}</a></span>
                                    <span>|&nbsp; &nbsp;</span>
                                    <span class="meta-comments">${fn:length(comments)}</span>
                                </div>
                                <div class="card">
                                    ${blog.description}
                                </div>
                                <!-- related post block -->
                            </div>
                        </div>
                        <div class="related-post">
                            <div class="row">
                                <div class="col-lg-12 col-sm-12 col-md-12 col-sm-12">
                                    <div class="related-head">
                                        <h3 class="related-post-title mb30">Bài viết liên quan</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="related-post-block">
                                <div class="row">
                                    <c:forEach items="${blogs}" var="item">
                                        <div class="col-lg-4 col-sm-4 col-md-4 col-xs-12">
                                            <div class="related-post-content">
                                                <!-- related post -->
                                                <div class="related-img">
                                                    <a href="./blog/${item.url }" class="imghover"><img src="${item.avatar }"
                                                                                                        alt="" class="img-responsive"></a>
                                                </div>
                                                <h4 class="related-title"><a href="./blog/${item.url }" class="title">${item.title }</a></h4>
                                                <div class="meta post-meta">${item.shortDescription}</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- /.related post -->
                                </div>
                            </div>
                        </div>
                        <!-- /.related post block -->
                        <!--comments start-->
                        <div class="comment-area">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="">
                                        <div class="comment-head">
                                            <h3 class="comment-heading">Bình luận (${fn:length(comments) })</h3>
                                        </div>
                                    </div>
                                    <c:forEach items="${comments}" var="item">
                                        <ul class="comment-list">
                                            <li>
                                                <div class="comment-author"><img src="../assets/images/user_img_1.jpg" alt=""
                                                                                 class="img-circle"></div>
                                                <div class="comment-info">
                                                    <div class="comment-header">
                                                        <h5 class="comment-title">${ item.userName}</h5>
                                                        <span class="comment-meta-date">${ item.createDate}</span>
                                                    </div>
                                                    <div class="comment-content">
                                                        <p>${ item.description}</p>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--comments close-->
                </div>
                <div class="leave-comments">
                    <div class="leave-comments-head">
                        <h3 class="leave-comments-title">Để lại bình luận</h3>
                    </div>
                    <div class="leave-comments-body">
                        <div class="row">
                            <form>
                                <div class="col-lg-6 col-md-6 col-md-6 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label required sr-only " for="name"></label>
                                        <input id="name" name="name" type="text" class="form-control"
                                               placeholder="tên của bạn" required>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-md-6 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label required  sr-only" for="email"></label>
                                        <input id="email" name="email" type="email" class="form-control"
                                               placeholder="Địa chỉ email" required>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-md-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label sr-only" for="textarea"></label>
                                        <textarea class="form-control" id="textarea" name="textarea" rows="5"
                                                  placeholder="Bình luận"></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-md-6 col-xs-12">
                                    <div class="form-group">
                                        <button id="singlebutton" name="singlebutton"
                                                class="btn btn-primary btn-sm">Gửi
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <!-- widget-search-start -->
                <div class="widget widget-search">
                    <div class="widget-body">
                        <form>
                            <div class="search-form">
                                <input type="text" class="form-control" placeholder="Tìm kiếm ở đây">
                                <button type="Submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- widget-search-close -->
                <!-- widget-categories-start -->
                <div class=" widget widget-categories">
                    <div class="widget-head">
                        <h2 class="widget-title">Theo thể loại</h2>
                    </div>
                    <div class="widget-body">
                        <ul class="arrow">
                            <li class="active"><a href="#"> Smartphones</a></li>
                            <li><a href="#">Android Phones</a></li>
                            <li><a href="#">iphone</a></li>
                            <li><a href="#">iphone X</a></li>
                        </ul>
                    </div>
                </div>
                <!-- widget-categories-close -->
                <!-- widget-archievs-start -->
                <div class=" widget widget-categories">
                    <div class="widget-head">
                        <h2 class="widget-title">Theo tháng</h2>
                    </div>
                    <div class="widget-body">
                        <ul class="arrow">
                            <li class="active"><a href="#">Tháng 12 (2021)</a></li>
                            <li><a href="#">Tháng 11 (2021)</a></li>
                            <li><a href="#">Tháng 10 (2021)</a></li>
                            <li><a href="#">Tháng 9 (2021)</a></li>
                        </ul>
                    </div>
                </div>
                <!-- widget-archievs-close -->
                <div class=" widget widget-categories">
                    <div class="widget-head">
                        <h2 class="widget-title">Theo người đăng</h2>
                    </div>
                    <div class="widget-body">
                        <ul class="arrow">
                            <li class="active"><a href="#">Admin </a></li>
                            <li><a href="#">Khách hàng</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- footer -->
</body>

<jsp:include page="/sub-component/footer.jsp"/>

<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:40 GMT -->
</html>