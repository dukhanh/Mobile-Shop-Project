function addToFavorite(btn, id, userId) {

    if (userId != null) {
        btn.style.backgroundColor = '#fb730f';
    }
    $.ajax({
        url: '/add_favorite',
        type: 'GET',
        data: {
            id: id
        },
        success: function (data) {

        }
    });


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
