var ClientCertification = (function(){

  function initFormEvents(){
    Material.search({selector: elements.rubroSearch, url: setSearchRubroUrl});
    $("#details-body").on("nested:fieldAdded", function(event, insertedItem) {
      $(event.target).find(':input').enableClientSideValidations();
      var name_field = event.field.find(elements.rubroSearch.selector);
      Material.search($.extend({selector: name_field.val($(event.link).data('predefined-name')), url: setSearchRubroUrl}));
    });
  }

  return {
    init: function() {
      elements =
        {
          rubroSearch: $('.rubro-search')
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
    setSearchRubro: function(url) {
      setSearchRubroUrl = url;
    }
  };

}());
