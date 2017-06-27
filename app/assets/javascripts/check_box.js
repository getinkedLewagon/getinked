$(document).ready(function() {
    $('input:checkbox.cool').bootstrapSwitch('onColor', 'success');
  });

  $(function() {
    var availableCities = [
      "Barcelona",
      "Berlin",
      "Rome",
      "London",
      "Benidorm",
      "Badalona",
      "New York",
    ];

    $('#artist-edit-search').autocomplete({
      source: availableCities
    });
  } );
