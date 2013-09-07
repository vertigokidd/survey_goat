require 'faker'


user = User.create(email: "a@b.com",
            password: "1234")


user.surveys.create({title: "Up or Down"})

survey = Survey.find(1)

survey.questions.create({content: "Do you want to go up or down?"})

question = Question.first

answer_1 = question.answers.create({choice: "up"})
answer_2 = question.answers.create({choice: "down"})

# Result.new(question_id: 1)
# Result.new(question_id: 2)

answer_1.results.create
answer_2.results.create
answer_1.results.create
answer_2.results.create
answer_2.results.create
answer_2.results.create
answer_2.results.create
answer_2.results.create



