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