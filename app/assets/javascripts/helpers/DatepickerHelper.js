var DatepickerHelper = {
  initDatepicker: function(selector, opciones) {
    if(typeof opciones === 'undefined')
      opciones = {};

    $(selector).datepicker(opciones);
      // Evento para el boton al lado del campo datepicker
      $(selector + ' + .input-group-btn').on('click', function(e){
        $(this).siblings('.datepicker').datepicker('show');
      });
  },
  initDateRangePicker: function(selector) {
    $(selector).daterangepicker(
      {
        startDate: moment().subtract(30, 'days'),
        endDate: moment(),
        showDropdowns: true,
        ranges: {
          'Hoy': [moment(), moment()],
          'Ayer': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Últimos 30 dias': [moment().subtract(29, 'days'), moment()],
          'Este mes': [moment().startOf('month'), moment().endOf('month')]
        },
        opens: 'right',
        buttonClasses: ['btn'],
        applyClass: 'btn-flat bg-green btn-sm',
        cancelClass: 'btn-flat bg-default btn-sm',
        format: 'DD/MM/YYYY',
        separator: ' hasta ',
        locale: {
          applyLabel: 'Aplicar',
          cancelLabel: 'Limpiar',
          fromLabel: 'Desde',
          toLabel: 'Hasta',
          customRangeLabel: 'Rango',
          daysOfWeek: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi','Sa'],
          monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
          firstDay: 1
        }
      },
      function(start, end) {
        $(selector).find('.fecha-desde').val(start.format('DD/MM/YYYY')).trigger('change');
        $(selector).find('.fecha-hasta').val(end.format('DD/MM/YYYY')).trigger('change');
        $(selector).find('span').html(start.format('DD/MM/YYYY') + ' - ' + end.format('DD/MM/YYYY'));
      }
    );
    $(selector).on('cancel.daterangepicker', function(ev, picker) {
      $(selector).find('.fecha-desde').val("").trigger('change');
      $(selector).find('.fecha-hasta').val("").trigger('change');
      $(selector).find('span').html("Fecha");
    });

  }

};
