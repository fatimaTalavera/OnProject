var InputMaskHelper = {

  tel_fax_mask: function(selector) {
    $(selector).inputmask({
      alias: 'tel_fax_mask',
      mask: '(999) 999 999',
      digits: 12,
      removeMaskOnSubmit: false }
    );
  },

  celphone_mask: function(selector) {
    $(selector).inputmask({
      alias: 'celphone_mask',
      mask: '(9999) 999 999',
      digits: 13,
      removeMaskOnSubmit: false }
    );
  }

};
