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


function buscarRub (currentElement){
    $("#table tbody").html("");
    var rub = $(currentElement).val();
    if (rub !== ""){
        $.ajax({
            url: '/budgets/' + rub,
            type: 'GET',
            dataType: 'json',
            success: function(res){
                res.budget_details.forEach(function(obj) {
                    var item;
                    var rubro = obj.rubro_id;
                    var quantity = obj.quantity;
                    var price = obj.price ;
                    item += '<tr>';
                    item += '<td> ' + rubro + ' </td>';
                    item += '<td>  </td>';
                    item += '<td> ' + quantity + ' </td>';
                    item += '<td> ' + price + ' </td>';
                    item += '<td>  </td>';
                    item += '</tr>';
                    $("#table tbody").append(item);
                    self.find().val(price);
                });
            }

        })
    }
};


