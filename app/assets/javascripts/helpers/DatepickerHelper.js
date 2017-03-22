var DatepickerHelper = {

    initDatepicker: function(selector, opciones) {

        if(typeof opciones === 'undefined')
            opciones = {};

        $(selector).datepicker(opciones);

    }

};
