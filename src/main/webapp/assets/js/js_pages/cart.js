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

function addToCart(productId){

}


$('#check-all').change(function () {
    if (this.checked) {
        $('#cart-table input[type="checkbox"]').each(function () {
            $(this).prop('checked', true);
        });
    } else {
        $('#cart-table input[type="checkbox"]').each(function () {
            $(this).prop('checked', false);
        });
    }
});

$('#cart-table tbody input[type="checkbox"]').change(function () {
    if ($('#cart-table tbody input[type="checkbox"]:checked').length === $('#cart-table tbody input[type="checkbox"]').length) {
        $('#check-all').prop('checked', true);
    } else {
        $('#check-all').prop('checked', false);
    }
});