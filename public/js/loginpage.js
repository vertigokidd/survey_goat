$(document).ready(function() {

  $("#signup input").first().on("keyup", function(){
    var reEmail = new RegExp("\\S+@\\S+.\\w{2,5}");
    if (reEmail.test($(this).val()) === false) {
      $('#signup p').html("<p style='color:red;''>Invalid email</p>")
    }
    else {
      $('#signup p').empty();
    }
  });


});
