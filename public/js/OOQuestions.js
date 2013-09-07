function questionTemplate () {
  question = $(".questionBox").clone();
}

function choiceTemplate () {
  choice = $(".questionBox input:first").clone();
}




function Question (number) {
  this.number = number
  this.question = question.clone();

  $(this.question).children('textarea').attr('name','question_'+ this.number+"[content]");
  $(this.question).children('input:first').attr('name', 'question_'+ this.number+'[choice_1]');
  $(this.question).children('input:last').attr('name', 'question_'+ this.number+'[choice_2]');

  if (number <= 2) {
    $(this.question).children('span').remove();
  };

}


function Choice (argument) {
  // body...
}






$(document).ready(function() {

  first = new Question(1);

  first.appendTo('ol')



}
