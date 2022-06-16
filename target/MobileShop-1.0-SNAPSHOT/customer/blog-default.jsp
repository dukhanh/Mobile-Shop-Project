<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
    <jsp:include page="/sub-component/header.jsp"/>
    <title>Blog</title>
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
                        <li>Blog</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.page-header-->
<!-- blog -->
<div class="space-medium">
    <div class="container">
        <div class="row">
            <div class="isotope">
                <c:forEach items="${blogs}" var="item">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 post-masonry ">
                        <div class="post-block">
                            <!-- post block -->
                            <h3 class="post-title">
                                <a href="#" class="title">${item.title}</a>
                            </h3>
                            <div class="meta">
                                <span class="meta-date">${item.createDate}</span>
                            </div>
                            <div class="post-img">
                                <a href="./blog/${item.url }" class="imghover"> <img src="${item.avatar}"
                                                                                     alt="${item.title}"
                                                                                     class="img-responsive"></a>
                            </div>
                            <div class="post-content">
                                <p></p>${item.shortDescription}
                                <a href="./blog/${item.url }" class="btn-link">
                                    <center>ĐỌC
                                        THÊM
                                    </center>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="row">
            <div class="st-pagination">
                <ul class="pagination">
                    <c:if test="${page != 1}">
                        <li><a href="./blog?page=${page-1}" aria-label="previous"><span
                                aria-hidden="true">Trang trước</span></a></li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${countPage}">
                        <c:if test="${page == i}">
                            <li class="active"><a href="#">${i}</a></li>
                        </c:if>
                        <c:if test="${page != i}">
                            <li><a href="./blog?page=${i}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${page != countPage}">
                        <li><a href="./blog?page=${page+1}" aria-label="Next"><span
                                aria-hidden="true">Trang sau</span></a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- blog -->
<!-- footer -->

<jsp:include page="/sub-component/footer.jsp"/>
</body>


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:40 GMT -->
</html>