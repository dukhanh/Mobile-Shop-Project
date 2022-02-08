function decreaseQuantity(btn, productId) {
    const inputQ = btn.nextElementSibling;
    let currentQuantity = parseInt(inputQ.value);
    if (currentQuantity > 1) {
        currentQuantity = currentQuantity - 1;
        const amountEle = document.getElementById('cart-quantity');
        let amount = parseInt(amountEle.innerText);
        amountEle.innerHTML = amount - 1;
    } else {
        currentQuantity = 1;
    }
    inputQ.value = currentQuantity;
    $.ajax({
        url: '/update_quantity_product_cart',
        type: 'GET',
        data: {
            'quantity': currentQuantity,
            'product': productId,
        },
        success: function (data) {

        }
    });

    // call function to calculate total price
    calTotalCart();
}

function increaseQuantity(btn, productId) {
    const inputQ = btn.previousElementSibling;
    let currentQuantity = parseInt(inputQ.value);
    if (currentQuantity < 5) {
        currentQuantity = currentQuantity + 1;
        const amountEle = document.getElementById('cart-quantity');
        let amount = parseInt(amountEle.innerText);
        amountEle.innerHTML = amount + 1;
    } else {
        currentQuantity = 5;
    }
    inputQ.value = currentQuantity;
    $.ajax({
        url: '/update_quantity_product_cart',
        type: 'GET',
        data: {
            'quantity': currentQuantity,
            'product': productId,
        },
        success: function (data) {

        }
    });

    // call function to calculate total price
    calTotalCart();
}

function deleteProductInCart(productId, index) {
    const amountEle = document.getElementById('cart-quantity');
    let amount = parseInt(amountEle.innerText);
    let quantityT = parseInt(document.getElementsByClassName('quantity-product-cart')[index].value);
    $.ajax({
        url: '/delete_product_cart',
        type: 'GET',
        data: {
            'product': productId,
        },
        success: function (data) {
            const row = document.getElementById('list-product-cart');
            row.innerHTML = data;
        }
    });
    amount = amount - quantityT;
    amountEle.innerHTML = amount;

    // call function to calculate total price
    calTotalCart();
}

function deleteProductSelected() {
    const amountEle = document.getElementById('cart-quantity');

    const productIds = [];
    const productIdsEle = document.getElementsByClassName('checkbox-element-child');
    for (let i = 0; i < productIdsEle.length; i++) {
        if (productIdsEle[i].checked) {
            let amount = parseInt(amountEle.innerText);
            let quantityT = parseInt(document.getElementsByClassName('quantity-product-cart')[i].value);
            amount = amount - quantityT;
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

function addToCart(productId, quantity) {
    const amountEle = document.getElementById('cart-quantity');
    let amount = parseInt(amountEle.innerText);
    if (quantity < 5) {
        amount = amount + 1;
        $.ajax({
            url: '/add_product_to_cart',
            type: 'GET',
            data: {
                'productId': productId,
                'quantity': quantity,
            },
            success: function (data) {

            }
        });
        amountEle.innerHTML = amount;

    }
    // call function to calculate total price
    calTotalCart();

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
// $('#check-all').on('change', function () {
//
// });
$(document).on('change', '#cart-table tbody input[type="checkbox"]', function () {
    if ($('#cart-table tbody input[type="checkbox"]:checked').length === $('#cart-table tbody input[type="checkbox"]').length) {
        $('#check-all').prop('checked', true);
    } else {
        $('#check-all').prop('checked', false);
    }
    // call function to calculate total price
    calTotalCart();
})
// $('#cart-table tbody input[type="checkbox"]').on('change', function () {
//
// })

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


