require 'faker'


user = User.create(email: "a@b.com",
            password: "123")


user.surveys.create({title: "Up or Down"})

survey = Survey.find(1)

survey.questions.create({content: "Do you want to go up or down?"})

question = Question.first

question.answers.create({choice: "up"})
question.answers.create({choice: "down"})

