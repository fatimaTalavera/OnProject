/**
 * Created by taniamonges on 4/13/2017.
 */


function getCertificationTotal(currentElement) {
    var max_digits = 9999999999;
    var max_discount = 100;
    var max_quantity = 365;
    var self = $(currentElement);
    var pay, quantity, discount;
    var aux_quantity = self.find('.quantity').val();
    var aux_pay = self.find('.pay').val();
    var aux_discount = self.find('.discount').val();

    if(aux_quantity < 0 || aux_quantity > max_quantity){
        quantity = 0;
        self.find('.quantity').val(quantity);
    }else{
        quantity = aux_quantity;
    }
    if(aux_pay < 0 || aux_pay > max_digits){
        pay = 75558;
        self.find('.pay').val(pay.toFixed(2));
    }else{
        pay = aux_pay;
    }
    if(aux_discount < 0 || aux_discount > max_discount){
        discount = 0;
        self.find('.discount').val(discount.toFixed(2));
    }else{
        discount = aux_discount;
    }
    var subtotal = (undefined !== pay && undefined !== quantity)? pay * quantity : 0;
    var discount = (undefined !== discount && undefined !== subtotal)? discount/100 : 0;
    if(discount === 0){
        self.find('.subtotal').val(Math.round(subtotal));
        self.find('.total').val(Math.round(subtotal));
    }else{
        self.find('.subtotal').val(Math.round(subtotal));
        subtotal = subtotal - (subtotal * discount);
        self.find('.total').val(Math.round(subtotal));
    }

};





