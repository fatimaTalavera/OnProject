function getMaterialPrice(currentElement) {
    var material_id = $(currentElement).val();
    $.ajax({
        url: "/materials/" + material_id,
        type: "GET",
        dataType: "json",
        data: {
            id: material_id,
        },
        success: function (data) {
            var tr = $(currentElement).parent().parent();
            tr.find('.price').val(data.price);
            tr.find('.measurement_unit').val(data.measurement_unit);
            getMaterialTotal(tr);
        }
    });
};

function getServicePrice(currentElement) {
    var service_id = $(currentElement).val();
    $.ajax({
        url: "/services/" + service_id,
        type: "GET",
        dataType: "json",
        data: {
            id: service_id,
        },
        success: function (data) {
            var tr = $(currentElement).parent().parent();
            tr.find('.price').val(data.price);
            tr.find('.measurement_unit').val(data.measurement_unit);
            getServiceTotal(tr);
        }
    });
};

function getMaterialTotal(currentElement) {
    var self = $(currentElement);
    var price = self.find('.price').val();
    var measurement_unit = self.find('.measurement_unit').val();
    var quantity = self.find('.quantity').val();
    var total = (undefined !== price && undefined !== quantity)? price * quantity : 0;
    self.find('.total').val(total);
};

function getServiceTotal(currentElement) {
    var self = $(currentElement);
    var price = self.find('.price').val();
    var measurement_unit = self.find('.measurement_unit').val();
    var quantity = self.find('.quantity').val();
    var total = (undefined !== price && undefined !== quantity)? price * quantity : 0;
    self.find('.total').val(total);
};