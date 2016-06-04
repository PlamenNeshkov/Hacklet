var engine = new Bloodhound({
    datumTokenizer: function (datum) {
        return Bloodhound.tokenizers.whitespace(datum.value);
    },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
        wildcard: '%QUERY',
        url: '/search/users?query=%QUERY',
        transform: function (response) {
            return $.map(response, function (user) {
                return {
                    value: user.email
                };
            });
        }
    }
});

engine.initialize();

$('#reg-recipients-selection').tokenfield({
  typeahead: [null, { display: 'value', source: engine.ttAdapter() }]
});

$('#new-recipients-selection').tokenfield();
