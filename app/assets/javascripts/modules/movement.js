var Movement = (function(){

  function initFormEvents(){
    Material.search({selector: elements.materialSearch, url: setSearchMaterialUrl});
    Material.search({selector: elements.contractSearch, url: searchContractUrl});
    TableHelper.totalsEvent({selector: elements.materialSearch.selector, table: elements.table.selector, url: '/materials/'});
    NumberHelper.mascaraMoneda('.maskMoneda');
    $("#details-body").on("nested:fieldAdded", function(event, insertedItem) {
      //$(event.target).find(':input').enableClientSideValidations();
      NumberHelper.mascaraMoneda('.maskMoneda');
      var name_field = event.field.find(elements.materialSearch.selector);
      Material.search($.extend({selector: name_field.val($(event.link).data('predefined-name')), url: setSearchMaterialUrl}));
    });
  }

  return {
    init: function() {
      elements =
        {
          table: $('#movement-table'),
          materialSearch: $('.material-search'),
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
    setSearchMaterial: function(url) {
      setSearchMaterialUrl = url;
    },
    setSearchContract: function(url) {
      searchContractUrl = url;
    }
  };

}());
