var DatepickerHelper = {

    initDatepicker: function(selector, opciones) {

        if(typeof opciones === 'undefined')
            opciones = {};

        opciones['endDate'] = '0d';
        opciones['zIndexOffset'] = '1001';

        if (opciones['limited'] === false){
            delete opciones.endDate;
        }

        $(selector).datepicker(opciones);

        $(selector + ' + .input-group-btn').on('click', function(e){
            $(this).siblings('.datepicker').datepicker('show');
        });
    }

};
