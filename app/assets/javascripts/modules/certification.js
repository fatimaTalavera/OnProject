var Certification = (function(){

  function initFormEvents(){
    Peoples.search({selector: elements.peopleSearch, url: searchPeopleUrl});
    $("#details-body").on("nested:fieldAdded", function(event, insertedItem) {
      //$(event.target).find(':input').enableClientSideValidations();
      var name_field = event.field.find(elements.peopleSearch.selector);
      Peoples.search($.extend({selector: name_field.val($(event.link).data('predefined-name')), url: searchPeopleUrl}));
    });
  }

  return {
    init: function() {
      elements =
        {
          table: $('#certification-table'),
          peopleSearch: $('.people-search')
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
    setSearchEmployee: function(url) {
      searchPeopleUrl = url;
    }
  };

}());
