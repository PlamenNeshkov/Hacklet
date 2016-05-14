var technologiesEngine = new Bloodhound({
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

var categoriesEngine = new Bloodhound({
    datumTokenizer: function (datum) {
        return Bloodhound.tokenizers.whitespace(datum.value);
    },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
        wildcard: '%QUERY',
        url: '/search/categories?query=%QUERY',
        transform: function (response) {
            return $.map(response, function (category) {
                return {
                    value: category.name
                };
            });
        }
    }
});

technologiesEngine.initialize();
categoriesEngine.initialize();

$('#technologies-selection').tokenfield({
    typeahead: [null, { display: 'value', source: technologiesEngine.ttAdapter() }]
});

$('#categories-selection').tokenfield({
    typeahead: [null, { display: 'value', source: categoriesEngine.ttAdapter() }],
    showAutocompleteOnFocus: true
});
