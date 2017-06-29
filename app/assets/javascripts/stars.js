// FUNCTION THAT COLORS STARS ON PAGE RELOAD WITH PERSISTING DATA


// FUNCTION THAT COLORS THE STARS ON HOVER

$('.star-rating-display').hover(function() {
  // Check if a label for a star is being hovered, this triggers two functions
  // the first for mouse-enter, the second for mouse-leave
  if (!$(this).parent().parent().hasClass('checked-star')) {
    // Check if the parent group of the label has the class checked-star
    // this indicates that an answer is filled in, if it's not filled in
    // the next line is executed
    starColor($(this), false);
    // Call the starColor method, with permanence = false. This will make the stars
    // change on hover but revert back to black on exit
  }
},
function() {
  // This function is triggered on mouse-leave
  if (!$(this).parent().parent().hasClass('checked-star')) {
        // Check if the parent group of the label has the class checked-star
    // this indicates that an answer is filled in, if it's not filled in
    // the next line is executed
    $(this).parent().parent().each(function( index, item ){
      // Loop over all items in the current group
      $('i', this).css('color', '#D8D8D8');
      // Color all stars in the current group black
    });
  }

}
);


// FUNCTION TO COLOR THE STARS

function starColor(starSelected, starPermanence){
  // Record a click on the label and initiate action
  var starNumber = parseInt($(starSelected).attr('id'));
  // Assign integer number of stars associated with item clicked on to variable
  var groupSelector = $(starSelected).data('target');
  // Find out which group the clicked item belongs to and store it to a variable
  if (starPermanence == true) {
    $('#placeholder').text(starNumber);
    // If the method is passed the second parameter with a value of true
    // the next code is executed, in practice the true/false difference lies
    // with the difference between hover and click
    var starUpdate = $(starSelected).parent().parent();
    // Find the group the current star is a part of
    starUpdate.addClass('checked-star')
    // Add the class 'checked-star' to the group
  }
  $(groupSelector).find('i').css('color', '#D8D8D8');
    // Set all stars in the set to the inactive color
    $(groupSelector).find('.radio').each(function( index, item ) {
    // Select all the radio buttons within the same group as the item that is clicked and iterate
    if(parseInt($(this).find('label').attr('id')) <= starNumber ) {
      // Check condition if radio button is of a lower or equal number as the one that is clicked
      $(this).find('i').css('color', '#000000');
      // Change color of item to the active colour
    }
  });
  }
  // When star gets clicked, the starColor method will get called and
  // color the stars
  $('.rating-stars-item label').on('click', function(event) {
    starColor(this, true);
  });
