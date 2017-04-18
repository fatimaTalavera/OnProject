function getRubroPriceB(currentElement) {
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
            tr.find('.price').val(data.final_price);
            tr.find('.utility').val(data.utility);
            tr.find('.measurement_unit').val(data.measurement_unit);
            getBudgetTotal(tr);
        }
    });
};


function getBudgetTotal(currentElement) {
    var self = $(currentElement);
    var price = self.find('.price').val();
    var quantity = self.find('.quantity').val();
    var utility = self.find('.utility').val();
    var measurement_unit = self.find('.utility').val();
    var total = (undefined !== price && undefined !== quantity)? price * quantity : 0;
    self.find('.total').val(total);
};
