$(document).ready(function() {

  function buttonOff() {
    $("#signup input").last().attr("disabled", true);
  }
 
  function buttonOn() {
    $("#signup input").last().attr("disabled", false);
  }

  $("#signup input").first().on("keyup", function(){
    var reEmail = new RegExp("\\w+@\\w+\\.\\w{2,7}");    
    if (reEmail.test($(this).val()) === false) {
      $('#signup p').html("<p style='color:red;''>Invalid email</p>");
      buttonOff();
    }
    else {
      $('#signup p').empty();
    }
  });

  $($("#signup input")[1]).on("keyup", function(){
    var reLength = new RegExp("\\S{4,}");
    second_password = $($("#signup input")[2]).val();
    if (reLength.test($(this).val()) === false) {
      $('#signup p').html("<p style='color:red;''>Password must be at least four characters</p>");
      buttonOff();
    }
    else if (reLength.test(second_password) === false) {
      $('#signup p').html("<p style='color:red;''>Password must be at least four characters</p>");
      buttonOff();
    }
    else {
      $('#signup p').empty();
    }
  });

  $($("#signup input")[2]).on("keyup", function(){
    var reLength = new RegExp("\\S{4,}");
    first_password = $($("#signup input")[1]).val();
    if (($(this).val()) != first_password) {
      $('#signup p').html("<p style='color:red;''>Passwords do not match</p>");
      buttonOff();
    }
    else if (reLength.test(first_password) === false) {
      $('#signup p').html("<p style='color:red;''>Password must be at least four characters</p>");
      buttonOff();
    }
    else {
      $('#signup p').empty();
      buttonOn();
    }
  });

});
