var CompanyConfig = (function(){

  function initFormEvents(){
    InputMaskHelper.tel_fax_mask('.tel-fax-mask'),
    InputMaskHelper.celphone_mask('.celphone-mask')
  }

  return {
    init: function() {
    },
    index: function() {
    },
    'new': function() {
    },
    'create': function(){
    },
    'edit': function() {
    },
    'update': function(){
      initFormEvents();
    },
    'edit_company': function(){
      initFormEvents();
    }
  };

}());
