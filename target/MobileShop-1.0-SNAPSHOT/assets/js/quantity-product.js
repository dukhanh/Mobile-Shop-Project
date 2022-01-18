
$(document).ready(function() {
    $('.decrease-quantity').on('click', function (e) {
        e.preventDefault();
        const $this = $(this);
        const $input = $this.closest('div').find('input');
        let value = parseInt($input.val());

        if (value > 2) {
            value = value - 1;
        } else {
            value = 1;
        }
        $input.val(value);
    });
});
$(document).ready(function() {
    $('.increase-quantity').on('click', function (e) {
        e.preventDefault();
        const $this = $(this);
        const $input = $this.closest('div').find('input');
        let value = parseInt($input.val());
        value = value + 1;
        $input.val(value);
    });
});