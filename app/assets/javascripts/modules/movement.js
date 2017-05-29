var Movement = (function(){

  function initFormEvents(){
    Material.search({selector: elements.materialSearch, url: setSearchMaterialUrl});
    $("#details-body").on("nested:fieldAdded", function(event, insertedItem) {
      //$(event.target).find(':input').enableClientSideValidations();
      var name_field = event.field.find(elements.materialSearch.selector);
      Material.search($.extend({selector: name_field.val($(event.link).data('predefined-name')), url: setSearchMaterialUrl}));
    });
  }

  return {
    init: function() {
      elements =
        {
          table: $('#movement-table'),
          materialSearch: $('.material-search')
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
    }
  };

}());
