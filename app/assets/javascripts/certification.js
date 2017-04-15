/**
 * Created by taniamonges on 4/13/2017.
 */


function getCertificationTotal(currentElement) {
    var self = $(currentElement);
    var pay = self.find('.pay').val();
    var quantity = self.find('.quantity').val();
    var discount = self.find('.discount').val();
    var subtotal = (undefined !== pay && undefined !== quantity)? pay * quantity : 0;
    var discount = (undefined !== discount && undefined !== subtotal)? discount/100 : 0;
    if(discount === 0){
        self.find('.subtotal').text(subtotal);
        self.find('.total').text(subtotal);
    }else{
        self.find('.subtotal').text(subtotal);
        subtotal = subtotal - (subtotal * discount);
        self.find('.total').text(subtotal);
    }

};

