// configuraciones por default para datepicker
$.fn.datepicker.defaults.language = 'es'; // datepickeren español
$.fn.datepicker.defaults.autoclose = true; // que se cierre luego de elegir una fecha
$.fn.datepicker.defaults.format = 'dd/mm/yy'; // formato por defecto
$.fn.datepicker.defaults.todayHighlight = true;
$.fn.datepicker.defaults.startDate = moment([1900]).toDate(); // Prevenir que se seleccione fecha cero
