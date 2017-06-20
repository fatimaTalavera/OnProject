function checkPrice(price) {
  return isNaN(price) ? 0 : price;
}
var SaleTableHelper = {
    totalsEvent: function(options) {
        var table = options.table;
        $(table).on('change', options.selector, function () {
            var row = $(this).parents('tr');
            var last_row = $(table).find("tr").last().find('.table-total');
            $.ajax({
                url: options.url + row.find(options.selector).val() + '/get_detail',
                type: "GET",
                dataType: "json"
            }).done(function (data) {
                var total = NumberHelper.aNumero(last_row.text());
                var price = data.total;
                row.find('.price').text(NumberHelper.aMoneda(price));
                var advancePayment = parseFloat(row.find('.advance-payment').text());
                isNaN(advancePayment) ? 0 : advancePayment;
                var subtotal = NumberHelper.aNumero(row.find('.subtotal').text());
                total -= subtotal;
                var subtotal = price * (100 - advancePayment) / 100;
                row.find('.subtotal').text(I18n.toCurrency(subtotal, {unit: ''}));
                total += parseFloat(subtotal);
                last_row.text(NumberHelper.aMoneda(total));
                $('.input_total').val(total);
            }).fail(function () {
                alert("Ha ocurrido un error inesperado.");
            });
        });

      $(table).on('click', '.remove_nested_fields', function(){
        var row = $(this).parents('tr');
        var last_row = $(table).find("tr").last().find('.table-total');
        var total = parseFloat(NumberHelper.aNumero(last_row.text()));
        var subtotal = parseFloat(NumberHelper.aNumero(row.find('.subtotal').text()));
        total -= subtotal;
        last_row.text(NumberHelper.aMoneda(total));
        $('.input_total').val(total);
      });

    }
};
