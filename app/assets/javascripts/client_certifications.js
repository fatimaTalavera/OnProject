function getRubroPrice(currentElement) {
    var rubro_id = $(currentElement).val();
    if (rubro_id !== ""){
    $.ajax({
        url: "/budgets/" + rubro_id + "/get_detail",
        type: "GET",
        dataType: "json",
        data: {
            id: rubro_id,
        },
        success: function (data) {
            var tr = $(currentElement).parent().parent();
            var price = data.price;
            var quantity = data.certified_quantity;
            tr.find('.price').val(price);
            tr.find('.quantity').val(quantity);
            getRubroTotal(tr);
        }
    });
    }
};

function getRubroTotal(currentElement) {
    var self = $(currentElement);
    var amount_made = self.find('.quantity').val();
    var price = self.find('.price').val();
    var quantity = self.find('.amount_to_certify').val();
    if (quantity > amount_made){
                $("#myModal").modal();
    }else{
    var total = (undefined !== price && undefined !== quantity)? price * quantity : 0;
    }
    self.find('.total').val(Math.round(total));
};


