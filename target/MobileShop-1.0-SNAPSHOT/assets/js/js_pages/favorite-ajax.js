function addToFavorite(btn, id, isLogin) {
    const message = document.getElementById('message');
    if (isLogin) {
        btn.style.backgroundColor = '#fb730f';
        $.ajax({
            url: '/add_favorite',
            type: 'GET',
            data: {
                id: id,
            },
            success: function (data) {
                if (data === 'success') {
                    message.innerHTML = '' +
                        '<div>\n' +
                        '        <i class="far fa-check-circle"></i>\n' +
                        '        <p>Đã thêm sản phẩm vào danh sách yêu thích</p>\n' +
                        '</div>';
                    message.style.display = 'block';
                    setTimeout(function () {
                        message.style.display = 'none';
                    }, 1500);
                }
            }
        });
    }else{
        message.innerHTML = '' +
            '<div>\n' +
            '        <i class="far fa-times-circle"></i>\n' +
            '        <p>Vui lòng đăng nhập để thực hiện chức năng này</p>\n' +
            '</div>';
        message.style.display = 'block';
        setTimeout(function () {
            message.style.display = 'none';
        }, 1500);
    }


}

function deleteProductFavorite(id) {
    //ajax
    $.ajax({
        url: '/delete_favorite',
        type: 'GET',
        data: {
            'productId': id,
        },
        success: function (data) {
            const row = document.getElementById('list-favorites');
            row.innerHTML = data;
        },

    });
}
