var Sale = (function(){

  function initFormEvents(){
    Material.search({selector: elements.contractSearch, url: searchContractUrl});
    $("#details-body").on("nested:fieldAdded", function(event, insertedItem) {
      //$(event.target).find(':input').enableClientSideValidations();
      var name_field = event.field.find(elements.contractSearch.selector);
      Material.search($.extend({selector: name_field.val($(event.link).data('predefined-name')), url: searchContractUrl}));
    });
  }

  return {
    init: function() {
      elements =
        {
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