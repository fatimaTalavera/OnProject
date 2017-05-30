function checkPrice(price) {
  return isNaN(price) ? 0 : price;
}
var SaleTableHelper = {
    totalsEvent: function(options) {
      var table = options.table;
      $(table).on('keyup', '.qty, .unit-price', function(){
        var row = $(this).parents('tr');
        var last_row = $(table).find("tr").last().find('.table-total');
        var total = NumberHelper.aNumero(last_row.text());
        var price = NumberHelper.aNumero(row.find('.unit-price').val());
        //isNaN(price) ? row.find('.unit-price').val(0) : price;
        var qty = parseFloat(row.find('.qty').val());
        var subtotal = NumberHelper.aNumero(row.find('.subtotal').text());
        total -= subtotal;
        subtotal = price * (isNaN(qty) ? 1 : qty);
        isNaN(qty) ? (row.find('.qty').val(1)) : qty;
        row.find('.subtotal').text(I18n.toCurrency(subtotal, {unit: ''}));
        total += parseFloat(subtotal);
        last_row.text(NumberHelper.aMoneda(total));
        $('.input_total').val(total);
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
