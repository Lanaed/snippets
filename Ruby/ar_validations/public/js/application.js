$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

   $(function() {
      $( "#datepicker" ).datepicker();
    });

    $("#frm").validate({
      rules:
      {
        name: {required: true},
        email: {required: true, email: true},
        title: {required: true},
        // date: {required: true, date: true}
      }
      }); //validate ends here

});
