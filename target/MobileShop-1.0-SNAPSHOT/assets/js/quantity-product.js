$('.decrease-quantity').click(function (e) {
    e.preventDefault();
    var $this = $(this);
    var $input = $this.closest('div').find('input');
    var value = parseInt($input.val());
    if (value > 2) {
        value = value - 1;
    } else {
        value = 1;
    }
    $input.val(value);

});

$('.increase-quantity').click(function (e) {
    e.preventDefault();
    var $this = $(this);
    var $input = $this.closest('div').find('input');
    var value = parseInt($input.val());

    if (value < 5) {
        value = value + 1;
    } else {
        value = 5;
    }
    $input.val(value);
});

