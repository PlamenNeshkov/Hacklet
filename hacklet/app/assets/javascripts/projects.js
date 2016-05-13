var engine = new Bloodhound({
    datumTokenizer: function (datum) {
        return Bloodhound.tokenizers.whitespace(datum.value);
    },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
        wildcard: '%QUERY',
        url: '/search/technologies?query=%QUERY',
        transform: function (response) {
            return $.map(response, function (technology) {
                return {
                    value: technology.name
                };
            });
        }
    }
});

engine.initialize();

$('#technologies-selection').tokenfield({
  typeahead: [null, { display: 'value', source: engine.ttAdapter() }]
});
