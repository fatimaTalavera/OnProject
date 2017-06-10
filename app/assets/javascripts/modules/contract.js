var Contract = (function () {

    function initFormEvents() {
        $('#has_advance_payment').change(function () {
            if (this.checked) {
                $('#advance_payment_section').css('display', 'block');
            } else {
                $('#advance_payment_section').css('display', 'none');
            }
        });

        $('#calculate-with-percentage').change(function (e) {
            var percentage = NumberHelper.aDecimal($(e.currentTarget).val());
            var contract_amount = $('#contract-amount').text();
            $('#calculate-with-amount').val(contract_amount * percentage / 100);
        });

        $('#calculate-with-amount').change(function (e) {
            var amount = NumberHelper.aNumero($(e.currentTarget).val());
            var contract_amount = $('#contract-amount').text();
            if (parseFloat(amount) > contract_amount) {
                $(e.currentTarget).val(contract_amount);
                amount = contract_amount;
            }
            $('#calculate-with-percentage').val(amount * 100 / contract_amount);
        });

    }

    return {
        init: function () {
        },
        index: function () {
            DatepickerHelper.initDateRangePicker('#date-range');
        },
        'new': function () {
            initFormEvents();
        },
        'create': function () {
            initFormEvents();
        },
        'edit': function () {
            initFormEvents();
        },
        'update': function () {
            initFormEvents();
        }
    };

}());
