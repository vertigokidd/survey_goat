var questionCounter = 2
var question;


function addNewQuestion() {  
  questionClone = question.clone();

  $(questionClone).children('span').text(questionCounter+'.');
  $(questionClone).children('textarea').attr('name','question_'+ questionCounter+"[content]");
  $(questionClone).children('input:first').attr('name', 'question_'+ questionCounter+'[choice_1]');
  $(questionClone).children('input:last').attr('name', 'question_'+ questionCounter+'[choice_2]');
  // $(questionClone).children('.questionBox:nth-child(4)').attr('name', 'question_'+ questionCounter+'[choice_2]');

  // $(questionClone).insertBefore("#choice");

  console.log(question);

  $(questionClone).appendTo('ol');

}

function addNewChoice () {

  choices = $(".questionBox:last div");

  choiceCounter = choices.length + 1
  console.log(choiceCounter);
  questionNumber = $(".questionBox:last").children('span').text().slice(0,1);
  questionNumber = $(".questionBox:last")
  
  choiceClone = choice.clone();

  choiceClone.attr('name', 'question_'+questionNumber+'[choice_'+choiceCounter+']');

  $(choiceClone).appendTo(".questionBox:last");
  allFilled();
}

function questionTemplate () {
  question = $(".questionBox").clone();
}

function choiceTemplate () {
  choice = $(".questionBox input:last").clone();
}

function allFilled() {
    var allInputs = $(".questionBox :input");
    allInputs.push($('#create_title')[0]);
    console.log(allInputs);
    var filled = true;
    $(allInputs).each(function() {
        if($(this).val() == '') filled = false;
    });

    if(filled){
    $('#complete').removeAttr("disabled");      
    } 
    else {
      $('#complete').attr('disabled', 'disabled');
    }
    console.log(filled);
}


// function enableFormWhenComplete () {
//     var allInputs = $(":input");
//     $(allInputs).each(function() {
//        if($(this).val() === "")
//         complete = false;
//     });
// }

$(document).ready(function() {

  questionTemplate();

  choiceTemplate()

  $('#createForm').on('keyup', function() {
    allFilled();

  });



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
