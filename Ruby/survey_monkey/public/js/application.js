$(document).ready(function() {


    //validation of user signup
    $("#frm").validate({
      rules:
      {
        username: {
          required: true,
          rangelength: [3, 15]
      },
      email: {
          required: true,
          email: true
      },
      password: {
          required: true,
          rangelength: [4, 20]
      },
      password_confirm: {
          required: true,
          equalTo: "#password"
      }
  }
      }); //validate ends here


    $(function(){
        $('#open').click(function(){
            $('#open').hide();
            $('#modal-background').fadeIn();
        })



        $('#close').click(function(){
            $('#modal-background').fadeOut(function(){
                $('#open').show();
            });
        })
    })



    $(function(){
      $("#add_question").click(function(){

        $new_question_form=$("#question_form").clone()
        $("#title").after($new_question_form);
        $("#question_form").css("display","inline");
        $("#add_question").hide();


    })
  })




});
