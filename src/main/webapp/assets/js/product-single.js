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

function decreaseQuantity(btn) {
    const inputQ = btn.nextElementSibling;
    let currentQuantity = parseInt(inputQ.value);
    if (currentQuantity > 1) {
        currentQuantity = currentQuantity - 1;
        inputQ.value = currentQuantity;
    }
}

function increaseQuantity(btn, maxQuantity) {
    const inputQ = btn.previousElementSibling;
    let currentQuantity = parseInt(inputQ.value);
    if (currentQuantity < maxQuantity) {
        currentQuantity = currentQuantity + 1;
        inputQ.value = currentQuantity;
    }
    // call function to calculate total price
}

function addToCart(productId, isLogin) {
    const quantityE = document.getElementById('quantity-single');
    const amountEle = document.getElementById('cart-quantity');
    const message = document.getElementById('message');
    const quantity = quantityE.value;
    if (isLogin) {
        $.ajax({
            url: '/add_product_to_cart',
            type: 'GET',
            data: {
                'productId': productId,
                'quantity': quantity,
            },
            success: function (data) {
                if (data === 'new') {
                    let amount = parseInt(amountEle.innerText);
                    amount = amount + 1;
                    amountEle.innerHTML = amount;
                    message.innerHTML = '' +
                        '<div>\n' +
                        '        <i class="far fa-check-circle"></i>\n' +
                        '        <p>Sản phẩm đã được thêm vào giỏ hàng</p>\n' +
                        '</div>';
                } else {
                    if (data === 'increase') {
                        message.innerHTML = '' +
                            '<div>\n' +
                            '        <i class="far fa-check-circle"></i>\n' +
                            '        <p>Sản phẩm đã được thêm vào giỏ hàng</p>\n' +
                            '</div>';
                    } else {
                        if (data === 'fail') {

                            message.innerHTML = '' +
                                '<div>\n' +
                                '        <i class="far fa-times-circle"></i>\n' +
                                '        <p>Số lượng sản phẩm vượt quá số lượng cho phép</p>\n' +
                                '</div>';
                        }
                    }
                }
                message.style.display = 'block';
                setTimeout(function () {
                    message.style.display = 'none';
                }, 1500);
            }
        });
    } else {
        message.innerHTML =
            '<div>\n' +
            '        <i class="far fa-times-circle"></i>\n' +
            '        <p>Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng</p>\n' +
            '</div>';
        message.style.display = 'block';
        setTimeout(function () {
            message.style.display = 'none';
        }, 1500);
    }

}

function closeAsses() {
    $("#new-review-box").css('display', 'none');
    $("#overlay").css('display', 'none');
}

function openAsses(isLogin) {
    const message = document.getElementById('message');
    if (isLogin === true) {
        $("#new-review-box").css('display', 'block');
        $("#overlay").css('display', 'block');
    } else {
        message.innerHTML = '' +
            '<div>\n' +
            '        <i class="far fa-times-circle"></i>\n' +
            '        <p>Bạn cần đăng nhập để đánh giá sản phẩm</p>\n' +
            '</div>';
        message.style.display = 'block';
        setTimeout(function () {
            message.style.display = 'none';
        }, 1500);
    }

}






