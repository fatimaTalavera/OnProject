var Sale = (function(){

  function getCondition(){
     return $('.condition:checked').val();
  }

  function initFormEvents(){
    NumberHelper.mascaraMoneda('.maskMoneda');
    Material.search({selector: elements.contractSearch, url: searchContractUrl});
    SaleTableHelper.totalsEvent({selector: elements.contractSearch.selector, table: elements.table.selector});
    $("#details-body").on("nested:fieldAdded", function(event, insertedItem) {
      //$(event.target).find(':input').enableClientSideValidations();
      NumberHelper.mascaraMoneda('.maskMoneda');
      DatepickerHelper.initDatepicker('.datepicker');
    });
    $("#cuota-details-body").on("nested:fieldAdded", function(event, insertedItem) {
      //$(event.target).find(':input').enableClientSideValidations();
      NumberHelper.mascaraMoneda('.maskMoneda');
      DatepickerHelper.initDatepicker('.datepicker');
    });
    $(".condition").on("change",function(){
      var condition = getCondition();
      if ( condition === 'contado' ) {
        $('.accordion').css( "display", "none" );
      }
      else if (condition === 'crédito') {
        $('.accordion').css( "display", "block" );
      }
    }).trigger("change");
  }

  return {
    init: function() {
      elements =
        {
          table: $('#sale-table'),
          contractSearch: $('.contract-search')
        };
    },
    index: function() {
      DatepickerHelper.initDateRangePicker('#date-range');
    },
    'new': function() {
      initFormEvents();
    },
    'create': function(){
      initFormEvents();
    },
    'edit': function() {
      initFormEvents();
    },
    'update': function(){
      initFormEvents();
    },
    setSearchContract: function(url) {
      searchContractUrl = url;
    }
  };

}());
