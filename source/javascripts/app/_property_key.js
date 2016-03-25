//= require ../lib/_jquery
(function (global) {
  'use strict';

  function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split('&');
    for (var i = 0; i < vars.length; i++) {
      var pair = vars[i].split('=');
      if (decodeURIComponent(pair[0]) == variable) {
        return decodeURIComponent(pair[1]);
      }
    }
  }

  function replaceExamplePropertyKey(key) {
    $('span.s1').each(function() {
      var text = $(this).text();
      $(this).text(text.replace('EXAMPLE_PROPERTY_KEY', key));
    });
  }

  var propertyKey = getQueryVariable('property_key');

  $(function() {
    if (propertyKey) {
      replaceExamplePropertyKey(propertyKey);
    }
  });
})(window);
