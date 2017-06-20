function checkPrice(price) {
  return isNaN(price) ? 0 : price;
}
var TableBudgetHelper = {
  totalsEvent: function (options) {
    var table = options.table;
    $(table).on('change', options.selector, function () {
      var row = $(this).parents('tr');
      var last_row = $(table).find("tr").last().find('.table-total');
      $.ajax({
        url: options.url + row.find(options.selector).val(),
        type: "GET",
        dataType: "json"
      }).done(function (data) {
        var total = NumberHelper.aNumero(last_row.text());
        row.find('.measurement_unit').val(data.measurement_unit)
        row.find('.cost').val(data.price);
        row.find('.utility').val(data.utility);
        var price = Math.round(data.price * (1 + (data.utility/100)));
        row.find('.price').val(price);
        var subtotal = price * row.find('.quantity').val();
        row.find('.subtotal').text(subtotal);
      }).fail(function () {
        alert("Ha ocurrido un error inesperado.");
      });
    });

    $(table).on('keyup', '.quantity, .utility', function () {
      var row = $(this).parents('tr');
      var last_row = $(table).find("tr").last().find('.table-total');
      $.ajax({
        url: options.url + row.find(options.selector).val(),
        type: "GET",
        dataType: "json"
      }).done(function (data) {
        var total = NumberHelper.aNumero(last_row.text());
        var utility = row.find('.utility').val();
        var price = Math.round(data.price * (1 + (utility/100)));
        row.find('.price').val(price);
        var qty = parseFloat(row.find('.quantity').val());
        var subtotal = NumberHelper.aNumero(row.find('.subtotal').val());
        total -= subtotal;
        subtotal = price * (isNaN(qty) ? 0 : qty);
        row.find('.subtotal').val(subtotal);
        total += parseFloat(subtotal);
        last_row.text(NumberHelper.aMoneda(total));
      }).fail(function () {
        alert("Ha ocurrido un error inesperado.");
      });
    });

    $(table).on('click', '.remove_nested_fields', function () {
      var row = $(this).parents('tr');
      var last_row = $(table).find("tr").last().find('.table-total');
      var total = parseFloat(NumberHelper.aNumero(last_row.text()));
      var subtotal = parseFloat(NumberHelper.aNumero(row.find('.subtotal').val()));
      total -= subtotal;
      last_row.text(NumberHelper.aMoneda(total));
    });
  }
};
