var NumberHelper = {
    aMoneda: function(monto) {
        return I18n.toCurrency(monto);
    },
    aNumero: function(texto) {
        var n = texto.replace(/\./g, '');
        return isNaN(n) ? 0 : n;
    },
    mascaraMoneda: function(selector) {
        $(selector).inputmask({ alias: 'integer',
            radixPoint: ',',
            autoGroup: true,
            groupSeparator: '.',
            groupSize: 3,
            digits: 0,
            allowMinus: false,
            removeMaskOnSubmit: true });
    },

    // Para trabajar con porcentajes
    aPorcentaje: function(monto) {
        return I18n.toPercentage(monto);
    },
    aDecimal: function(texto) {
        var n = texto.replace(/\%/g, '').trim();
        return isNaN(n) ? 0 : n;
    },
    mascaraPorcentaje: function(selector) {
        $(selector).inputmask({ alias: 'percentage',
                                removeMaskOnSubmit: true });
    }
};
