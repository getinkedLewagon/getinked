$(document).ready(function() {
    $('input:checkbox').bootstrapSwitch('onColor', 'success');
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

    $('#artist-edit-search').autoComplete({
      source: availableCities
    });
  } );
