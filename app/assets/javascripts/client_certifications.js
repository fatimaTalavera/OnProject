function getRubroPrice(currentElement) {
    var rubro_id = $(currentElement).val();
    $.ajax({
        url: "/rubros/" + rubro_id,
        type: "GET",
        dataType: "json",
        data: {
            id: rubro_id,
        },
        success: function (data) {
            var tr = $(currentElement).parent().parent();
            var precio = data.price*(1 + data.utility/100);
            var formatPrice = precio.toFixed(2);
            tr.find('.price').val(formatPrice);
            getRubroTotal(tr);
        }
    });
};

function getRubroTotal(currentElement) {
    var self = $(currentElement);
    var price = self.find('.price').val();
    var quantity = self.find('.quantity').val();
    var precioDos = price;
    var total = (undefined !== price && undefined !== quantity)? precioDos * quantity : 0;
    self.find('.total').val(total);
};

