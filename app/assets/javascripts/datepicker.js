$( document ).ready(function() {
    $('#datetimepicker').datetimepicker({
      enabledHours: false,
      disabledHours: false,
      daysOfWeekDisabled: [0, 6],
      disabledDates: window.DISABLE_DATES,

    });

     $('#datetimepicker2').datetimepicker();
});
