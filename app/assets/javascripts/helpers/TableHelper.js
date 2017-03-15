var TableHelper = {
    rowsClicksEvent: function() {
        $('body').on('click','tr.row-click', function(e){
            window.location = $(this).data('url');
        });
    },
};
