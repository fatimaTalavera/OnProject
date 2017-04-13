function getMaterialPrice(currentElement) {
    var material_id = $(currentElement).val();
    $.ajax({
        url: "/materials/"+ material_id,
        type: "GET",
        dataType: "json",
        data: {
            id: material_id,
        },
        success: function (data) {
            var tr = $(currentElement).parent().parent();
            tr.find('.price').val(data.price);
            getMovementTotal(tr);
        }
    });
};

function getMovementTotal(currentElement) {
    var self = $(currentElement);
    var price = self.find('.price').val();
    var quantity = self.find('.quantity').val();
    var total = (undefined !== price && undefined !== quantity)? price * quantity : 0;
    self.find('.total').text(total);
};