var questionCounter = 2
var question;


function addNewQuestion() {
  questionClone= question.clone();

  $(questionClone).children('span').text(questionCounter+'.');
  $(questionClone).children('textarea').attr('name','question_'+ questionCounter+"[content]");
  $(questionClone).children('input:first').attr('name', 'question_'+ questionCounter+'[choice_1]');
  $(questionClone).children('input:last').attr('name', 'question_'+ questionCounter+'[choice_2]');
  $(questionClone).children('#questionBox:nth-child(4)').attr('name', 'question_'+ questionCounter+'[choice_2]');

  $(questionClone).insertBefore("#choice");
}

function addNewChoice () {
  choices = $(".questionBox:last input");
  choiceClone = $(choices).last().clone();
  questionNumber = $(".questionBox:last").children('span').text().slice(0,1);
  choiceCounter = choices.length + 1

  choiceClone.attr('name', 'question_'+questionNumber+'[choice_'+choiceCounter+']');

  $(choiceClone).appendTo(".questionBox:last");
}

function questionTemplate () {
  question = $(".questionBox").clone();
}


$(document).ready(function() {

  questionTemplate();

  $('#question').on('click', function(event) {
    event.preventDefault();

    addNewQuestion();

    questionCounter++;
  });


  $('#choice').on('click', function(event){
    event.preventDefault();

    addNewChoice();

  });




});
