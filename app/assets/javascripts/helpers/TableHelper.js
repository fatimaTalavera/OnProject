function checkPrice(price) {
  return isNaN(price) ? 0 : price;
}
var TableHelper = {
    rowsClicksEvent: function() {
        $('body').on('click','tr.row-click', function(e){
            window.location = $(this).data('url');
        });
    },

    totalsEvent: function(options) {
      var table = options.table;
      $(table).on('change', options.selector, function(){
        var row = $(this).parents('tr');
        var last_row = $(table).find("tr").last().find('.table-total');
        $.ajax({
          url: options.url + row.find(options.selector).val(),
          type: "GET",
          dataType: "json"
        }).done(function(data) {
          var total = parseFloat(last_row.text());
          row.find('.unit-price').val(data.price);
          var price = row.find('.unit-price').val();
          isNaN(price) ? 0 : price;
          var qty = row.find('.qty').val();
          var subtotal = parseFloat(row.find('.subtotal').text());
          total -= parseFloat(subtotal);
          var subtotal = price * (isNaN(qty) ? 1 : qty);
          row.find('.subtotal').text(subtotal);
          total += parseFloat(subtotal);
          last_row.text(total);
        }).fail(function() {
          alert("Ha ocurrido un error inesperado.");
        });
      });

      $(table).on('keyup', '.qty, .unit-price', function(){
        var row = $(this).parents('tr');
        var last_row = $(table).find("tr").last().find('.table-total');
        $.ajax({
          url: options.url + row.find(options.selector).val(),
          type: "GET",
          dataType: "json"
        }).done(function(data) {
          var total = parseFloat(last_row.text());
          var price = checkPrice(parseFloat(row.find('.unit-price').val()));
          //isNaN(price) ? row.find('.unit-price').val(0) : price;
          var qty = parseFloat(row.find('.qty').val());
          var subtotal = parseFloat(row.find('.subtotal').text());
          total -= parseFloat(subtotal);
          subtotal = price * (isNaN(qty) ? 1 : qty);
          isNaN(qty) ? (row.find('.qty').val(1)) : qty;
          row.find('.subtotal').text(subtotal);
          total += parseFloat(subtotal);
          last_row.text(total);
        }).fail(function() {
          alert("Ha ocurrido un error inesperado.");
        });
      });

      $(table).on('click', '.remove_nested_fields', function(){
        var row = $(this).parents('tr');
        var last_row = $(table).find("tr").last().find('.table-total');
        var total = parseFloat(last_row.text());
        var subtotal = parseFloat(row.find('.subtotal').text());
        total -= parseFloat(subtotal);
        last_row.text(total);
      });

    }
};
