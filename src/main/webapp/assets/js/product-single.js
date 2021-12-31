$(document).ready(function () {
    $('.less-evaluation').click(function () {
        $('.content-desc').css('height', '1180px');
        $(this).css('display', 'none');
        $('.more-evaluation').css('display', 'block');
    })
});

$(document).ready(function () {
    $('.more-evaluation').click(function () {
        $('.content-desc').css('height', 'auto');
        $(this).css('display', 'none');
        $('.less-evaluation').css('display', 'block');
    })
});

$(document).ready(function () {
    $('.page-scroll').click(function () {
        $('.page-scroll').removeClass('active');
        $(this).addClass('active');
    })
});


$(document).ready(function () {
    $(function () {
        $("#rateYo").rateYo({
            rating: 3.6,
            starWidth: "25px"
        });

    });
});

$('#slideshow').desoSlide({
    thumbs: $('ul.slideshow_thumbs li > a'),
    effect: {
        provider: 'animate',
        name: 'fade'
    }

});


