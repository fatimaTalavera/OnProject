// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require i18n
//= require i18n/translations
//= require ./adminLTE/app.js
//= require ./libs/slimScroll/jquery.slimscroll.min.js
//= require ./libs/iCheck/icheck.js
//= require ./libs/bootstrap-datepicker/bootstrap-datepicker.js
//= require ./libs/bootstrap-datepicker/bootstrap-datepicker.es.js
//= require ./libs/select2/select2.full.min.js
//= require ./libs/select2/es.js
//= require ./libs/jquery.inputmask.js
//= require ./libs/data-tables/jquery.dataTables.min.js
//= require ./libs/data-tables/dataTables.bootstrap.min.js
//= require ./libs/moment.js
//= require ./libs/rails.validations
//= require ./libs/daterangepicker.js
//= require ./libs/defaults.configs.js
//= require jquery_nested_form
//= require_tree ./helpers
//= require_tree ./modules
//= require_tree .

OnProject = {
  common: {
    init: function() {

        $('body').popover({
            selector: '.on-hover[data-toggle=popover]',
            trigger: 'hover',
            placement: function(pop,ele){
                if($(ele).parent().is('td:first-child')) {
                    return 'right'
                } else if($(ele).parents('tr').is(':first-child')){
                    return 'bottom';
                }else{
                    return 'top'
                }
            }
        });

      $("#phone").inputmask("9999-999-999");

      $("#ci").inputmask("9999999999");

      //iCheck for checkbox and radio inputs
      $('input[type="checkbox"].square, input[type="radio"].square').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue'
      });

      $('.remote-search').on('keyup change', 'input, select', function (event) {
        if(event.type === 'change' && this.type === 'text')
          return false;

        var form = $(this).parents('form');
        delay(function() {
          var searchList = form.parents('.searchList').next('.searchResult');
          searchList.append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
          form.submit();
        }, 500);
      });

      $( ".tooltip_required" ).prepend('<abbr data-toggle="tooltip" data-original-title="Campo obligatorio"><font color="red">*&nbsp</font></abbr>');

      DataTableHelper.configLanguage('.data-table');

      DatepickerHelper.initDatepicker('.datepicker');

      BootstrapFilestyleHelper.filestyle('.file-style');

      I18n.locale = 'es';

    }
  },

  // Iniciar los modulos
  company_config: CompanyConfig,
  purchase_bills: Purchase,
  budgets: Budget

};

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
      timer = setTimeout(callback, ms);
  };
})();

UTIL = {
  exec: function( controller, action ) {
    var ns = OnProject,
      action = ( action === undefined ) ? "init" : action;

    if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) {
      ns[controller][action]();
    }
  },

  init: function() {
    var body = document.body,
      controller = body.getAttribute( "data-controller" ),
      action = body.getAttribute( "data-action" );

      UTIL.exec( "common" );
      UTIL.exec( controller );
      UTIL.exec( controller, action );
    }
};

$( document ).on('ready', UTIL.init );

jQuery(function ($) {
    window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
        if($(link).hasClass('insert_in_table')){
            return $(content).insertBefore($(link).parent().parent());
        }
        else{
            return $(content).insertBefore(link);
        }
    };
});


(function($) {

    $.fn.modal_success = function(){
        // close modal
        this.modal('hide');

        // clear form input elements
        // todo/note: handle textarea, select, etc
        this.find('form input[type="text"]').val('');

        // clear error state
        this.clear_previous_errors();
    };

    $.fn.render_form_errors = function(errors){

        $form = this;
        this.clear_previous_errors();
        model = this.data('model');

        // show error messages in input form-group help-block
        $.each(errors, function(field, messages){
            $input = $('input[name="' + model + '[' + field + ']"]');
            $input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') );
        });
    };
    $.fn.clear_previous_errors = function(){
        $('.form-group.has-error', this).each(function(){
            $('.help-block', $(this)).html('');
            $(this).removeClass('has-error');
        });
    }
}(jQuery));
