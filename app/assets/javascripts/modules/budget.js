var Budget = (function(){

  function initFormEvents(){
    NumberHelper.mascaraMoneda('.maskMoneda');
    Peoples.search({selector: elements.peopleSearch, url: searchPeopleUrl});
    Material.search({selector: elements.rubroSearch, url: searchRubroUrl});
    TableBudgetHelper.totalsEvent({selector: elements.rubroSearch.selector, table: elements.table.selector, url: '/rubros/'});
    $("#details-body").on("nested:fieldAdded", function(event, insertedItem) {
      NumberHelper.mascaraMoneda('.maskMoneda');
      $(event.target).find(':input').enableClientSideValidations();
      var name_field = event.field.find(elements.rubroSearch.selector);
      Material.search($.extend({selector: name_field.val($(event.link).data('predefined-name')), url: searchRubroUrl}));
    });
  }

  return {
    init: function() {
      elements =
        {
          table: $('#rubro-table'),
          peopleSearch: $('.people-search'),
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
      searchRubroUrl = url;
    },
    setSearchClient: function(url) {
      searchPeopleUrl = url;
    }
  };

}());
