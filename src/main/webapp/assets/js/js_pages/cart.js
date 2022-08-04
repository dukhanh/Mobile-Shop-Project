checkAllItem();

function decreaseQuantityInCart(btn, productId) {
    const inputQ = btn.nextElementSibling;
    let currentQuantity = parseInt(inputQ.value);
    currentQuantity = currentQuantity - 1;
    $.ajax({
        url: '/update_quantity_product_cart',
        type: 'GET',
        data: {
            'quantity': currentQuantity,
            'product': productId,
        },
        success: function (data) {
            if (data === 'success') {
                // currentQuantity = currentQuantity - 1;
                inputQ.value = currentQuantity;
                calTotalCart();
            }
        }
    });

    // call function to calculate total price
}

function increaseQuantityInCart(btn, productId) {
    const inputQ = btn.previousElementSibling;
    let currentQuantity = parseInt(inputQ.value);
    currentQuantity = currentQuantity + 1;
    $.ajax({
        url: '/update_quantity_product_cart',
        type: 'GET',
        data: {
            'quantity': currentQuantity,
            'product': productId,
        },
        success: function (data) {
            if (data === 'success') {
                // currentQuantity = currentQuantity + 1;
                inputQ.value = currentQuantity;
                calTotalCart();
            }
        }
    });
    // call function to calculate total price
}

function deleteProductInCart(productId, index) {
    const amountEle = document.getElementById('cart-quantity');
    let amount = parseInt(amountEle.innerText);
    // let quantityT = parseInt(document.getElementsByClassName('quantity-product-cart')[index].value);
    $.ajax({
        url: '/delete_product_cart',
        type: 'GET',
        data: {
            'product': productId,
        },
        success: function (data) {
            const row = document.getElementById('list-product-cart');
            row.innerHTML = data;

            // call function to calculate total price
            calTotalCart();
        }
    });
    amount = amount - 1;
    amountEle.innerHTML = amount;


}

function deleteProductSelected() {
    const amountEle = document.getElementById('cart-quantity');

    const productIds = [];
    const productIdsEle = document.getElementsByClassName('checkbox-element-child');
    for (let i = 0; i < productIdsEle.length; i++) {
        if (productIdsEle[i].checked) {
            let amount = parseInt(amountEle.innerText);
            // let quantityT = parseInt(document.getElementsByClassName('quantity-product-cart')[i].value);
            amount = amount - 1;
            amountEle.innerHTML = amount;
            productIds.push(productIdsEle[i].value);
        }
    }
    if (productIds.length > 0) {
        $.ajax({
            url: '/delete_product_selected_cart',
            type: 'GET',
            data: {
                'productIds': productIds,
            },
            success: function (data) {
                const row = document.getElementById('list-product-cart');
                row.innerHTML = data;
            }
        });
    }
    // call function to calculate total price
    calTotalCart();

}

function addToCart(productId, isLogin) {
    const amountEle = document.getElementById('cart-quantity');
    const quantity = 1;
    const message = document.getElementById('message');
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
        message.innerHTML = '' +
            '<div>\n' +
            '        <i class="far fa-times-circle"></i>\n' +
            '        <p>Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng</p>\n' +
            '</div>';
        message.style.display = 'block';
        setTimeout(function () {
            message.style.display = 'none';
        }, 1500);
    }

    // call function to calculate total price
    // calTotalCart();

}

$(document).on('change', '#check-all', function () {
    if (this.checked) {
        $('#cart-table input[type="checkbox"]').each(function () {
            $(this).prop('checked', true);
        });
    } else {
        $('#cart-table input[type="checkbox"]').each(function () {
            $(this).prop('checked', false);
        });
    }
    // call function to calculate total price
    calTotalCart();
})

function checkAllItem() {
    $(document).on('change', '#cart-table tbody input[type="checkbox"]', function () {
        if ($('#cart-table tbody input[type="checkbox"]:checked').length === $('#cart-table tbody input[type="checkbox"]').length) {
            $('#check-all').prop('checked', true);
        } else {
            $('#check-all').prop('checked', false);
        }
        // call function to calculate total price
        calTotalCart();
    })
}


function calTotalCart() {
    const productIdsEle = document.getElementsByClassName('checkbox-element-child');
    let productIds = [];
    for (let i = 0; i < productIdsEle.length; i++) {
        if (productIdsEle[i].checked) {
            productIds.push(productIdsEle[i].value);
        }
    }
    if (productIds.length > 0) {
        $.ajax({
            url: '/get_total_cart',
            type: 'GET',
            data: {
                'productId': productIds,
            },
            success: function (data) {
                const totalPriceTemp = document.getElementById('total-price-temp');
                const totalPrice = document.getElementById('total-price-cart');

                const priceTotal = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(data);
                totalPriceTemp.innerHTML = priceTotal;
                totalPrice.innerHTML = priceTotal;
                // alert(data);
            }
        });

    } else {
        const totalPriceTemp = document.getElementById('total-price-temp');
        const totalPrice = document.getElementById('total-price-cart');
        totalPrice.innerHTML = '0 đ';
        totalPriceTemp.innerHTML = '0 đ';
    }
}

function isChecked() {
    const productIds = [];
    const productIdsEle = document.getElementsByClassName('checkbox-element-child');
    for (let i = 0; i < productIdsEle.length; i++) {
        if (productIdsEle[i].checked) {
            productIds.push(productIdsEle[i].value);
        }
    }
    return productIds.length > 0;
}

function checkIsSelect() {
    if (!isChecked()) {
        alert("Vui lòng chọn ít nhất 1 sản phẩm");
    }
}



