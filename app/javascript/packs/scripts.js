// like document ready but after turbolinks load
$(document).on('turbolinks:load', function() {
  // mobile menu
  $('.sidenav').sidenav();
  // dropdown menu on pc
  $(".dropdown-trigger").dropdown();
  // fade effect for flash messages
  $("#fade-out-target").fadeOut(4000);
})
