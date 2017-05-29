var Rubro = (function(){

  function initFormEvents(){
    Material.search({selector: elements.materialSearch, url: setSearchMaterialUrl});
    Material.search({selector: elements.serviceSearch, url: searchServiceUrl});
    $("#material-details-body").on("nested:fieldAdded", function(event, insertedItem) {
      //$(event.target).find(':input').enableClientSideValidations();
      var name_field = event.field.find(elements.materialSearch.selector);
      Material.search($.extend({selector: name_field.val($(event.link).data('predefined-name')), url: setSearchMaterialUrl}));
    });
    $("#service-details-body").on("nested:fieldAdded", function(event, insertedItem) {
      //$(event.target).find(':input').enableClientSideValidations();
      var name_field = event.field.find(elements.serviceSearch.selector);
      Material.search($.extend({selector: name_field.val($(event.link).data('predefined-name')), url: searchServiceUrl}));
    });
  }

  return {
    init: function() {
      elements =
        {
          materialSearch: $('.material-search'),
          serviceSearch: $('.service-search'),
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
    setSearchService: function(url) {
      searchServiceUrl = url;
    }
  };

}());
