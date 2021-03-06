function questionTemplate () {
  question = $(".questionBox").clone();
}

function choiceTemplate () {
  choice = $(".choice").clone();
}

function Survey (defaultQuestionCount) {

  this.defaultQuestionCount = defaultQuestionCount;
  this.survey = $('#survey');
  this.button = $('#question');
  this.allInputs = $(".questionBox :input");

  for (var i = 1; i < defaultQuestionCount + 1; i++) {
    newQuestion = new Question(i);
    this.survey.append(newQuestion.question);
  };
  
  var self = this;
  this.button.click(function(event) {
      event.preventDefault();
      self.addQuestion();
  });

  $('#createForm').on('keyup', function() {
    self.checkFields();
  });

}

Survey.prototype.addQuestion = function() {
  this.defaultQuestionCount++;
  questions = this.defaultQuestionCount;
  var newQuestion = new Question(questions);
  $(this.survey).append(newQuestion.question);
};

Survey.prototype.checkFields = function(first_argument) {
    var allInputs = $("#createForm .questionBox input, #createForm textarea");
    allInputs.push($('#create_title')[0]);

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

};

function Question (number) {
  this.number = number;
  this.question = question.clone();
  this.button = $(this.question).find('button');
  this.choicesCount = 2;
  this.remove = $(this.question).children('span');

  $(this.question).children('textarea').attr('name','question_'+ this.number+"[content]");

  firstChoice = new Choice(this.number,1);
  secondChoice = new Choice(this.number,2);

  this.question.append(firstChoice.choice);
  this.question.append(secondChoice.choice);

  $(this.question).removeClass('invisible');

  var self = this;
  this.button.click(function(event) {
    event.preventDefault();
    self.addChoice();
  });

  this.remove.click(function(event) {
    $(self.question).remove();
  });

  if (this.number <= 1) {
    $(this.question).children('span').remove();
  };  

}

Question.prototype.addChoice = function() {
  this.choicesCount++
  choices = this.choicesCount;
  var newChoice = new Choice(this.number, choices)
    $(this.question).append(newChoice.choice);
  };

function Choice (questionNumber, choiceNumber) {
  $(parent).children('button:first').remove();
  this.choice = choice.clone();
  this.questionNumber = questionNumber;
  this.choiceNumber   = choiceNumber;

  $(this.choice).removeClass('invisible');

  $(this.choice).children('input').attr('name', 'question_'+this.questionNumber+'[choice_'+this.choiceNumber+']');
  if (this.choiceNumber <= 2) {
    $(this.choice).children('span').remove();
  };  

  this.choice.children('span').click(function(event) {
    $(this).parent().remove();
  });

}


$(document).ready(function() {

  questionTemplate();
  choiceTemplate();

  survey = new Survey(1);

  totalQuestions = $('#surveyWrapper span').length;
  $("#surveyWrapper :radio").change(function() {

    if ($(':radio:checked').length === totalQuestions) {
        $('#submitSurvey').removeAttr("disabled");      
    } else {
      $('#submitSurvey').attr('disabled', 'disabled');
    }
  });

  $('#signup img').addClass('enter');


});
