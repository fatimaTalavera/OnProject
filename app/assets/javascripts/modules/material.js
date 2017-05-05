var Material = (function(){

  return {

    search: function(options){
      options.selector.select2({
        minimumInputLength: 2,
        allowClear: true,
        ajax: {
          url: options.url,
          datatype: 'jsonp',
          data: function(term,page){
            return {
              q: term , // search term
              page: page
            };
          },
          processResults: function (data, params) {
            params.page = params.page || 1;
            return {
              results: data.items,
              pagination: {
                more: (params.page * 30) < data.total_count
              }
            };
          },
          cache: true
        },
        escapeMarkup: function (markup) { return markup; },
        templateResult: function(repo) {
          if (repo.loading) return repo.text;
            return repo.name;
        },
        templateSelection: function(repo) {
          return repo.name || repo.text;
        }
      });
    }

  };

}());
