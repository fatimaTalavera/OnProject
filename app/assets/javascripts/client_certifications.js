function getRubroPrice(currentElement) {
    var rubro_id = $(currentElement).val();
    if (rubro_id !== ""){
    $.ajax({
        url: "/budgets/" + rubro_id + "/get_detail",
        type: "GET",
        dataType: "json",
        data: {
            id: rubro_id
        },
        success: function (data) {
            var tr = $(currentElement).parent().parent();
            var price = Math.round(data.price);
            tr.find('.price').val(price);
            tr.find('.quantity').val(data.quantity - data.certified_quantity);
            tr.find('.measurement').val(data.measurement_unit);
            getRubroTotal(tr);
        }
    });
    }
};

function getRubroTotal(currentElement) {
    var self = $(currentElement);
    var amount_made = self.find('.quantity').val();
    var price = NumberHelper.aNumero(self.find('.price').val());
    isNaN(price) ? 0 : price;
    var quantity = self.find('.amount_to_certify').val();
    isNaN(quantity) ? 0 : quantity;
    if (Number(quantity) > amount_made){
        $("#myModal").modal();
    }else{
        var total = price * quantity;
    }
    self.find('.total').val(total);
};


