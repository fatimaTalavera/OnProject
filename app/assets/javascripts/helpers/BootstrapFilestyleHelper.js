var BootstrapFilestyleHelper = {

  filestyle: function(selector) {
    $(selector).filestyle({
      buttonBefore: true,
      buttonText: '',
      iconName: 'fa fa-folder-open-o',
      buttonName: 'bg-green',
      placeholder: 'Seleccionar una imagen'
    });
  }

};
