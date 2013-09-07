# GET ====================================

get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/create' do

  erb :create
end

get '/survey/:survey_id' do
  survey_id = params[:survey_id]
  @survey = Survey.find(survey_id)
  @questions = @survey.questions  

  erb :survey
end


get '/user/:user_id' do
  user_id = params[:user_id]
  @surveys = Survey.where("user_id = #{user_id}")
  erb :profile
end


get '/user/:user_id/survey/:survey_id' do
  survey_id = params[:survey_id]
  @survey = Survey.find(survey_id)
  @questions = @survey.questions  
  erb :results
end



# POST ====================================

post '/login' do
  email = params[:email]
  password = params[:password]
  user = User.find_by_email(email)
  if user.password == password
    redirect '/user/1'
  else
    @errors = "Username and password do not match."
    erb :index
  end
end

post '/signup' do
  email = params[:email]
  password = params[:password]
  if password != params[:verify_password]
    @signup_errors = "Password does not match, fool."
    erb :index
  else
  User.create({email: email, password: password})
  redirect '/'
  end
end

# create new survey
post '/create' do
  params_hash = params
  survey_title = params_hash[:survey][:title]
  # create a new survey
  survey = Survey.create({title: survey_title})
  params_hash.delete("survey")
  # for each question
  questions_array = params_hash.map { |kv| kv }
  
  p questions_array
    # make a new question for the survey
  questions_array.each do |question|

    question_info = question[1]
    content =  question_info["content"]
    new_question = survey.questions.create(content: content)
    question_info.delete("content")
    choices_array = question_info.map { |k,v| v }
    p choices_array

    choices_array.each do |choice|
      new_question.answers.create(choice: choice)
    end

  end

# SAMPLE PARAMS
# { "survey" => { title: "Favorite Colors" },
#   "question_1" => { content: 'Your favorite color?', choice_1: "red", choice_2: "green" },
#   "question_2" => { content: 'Your favorite kind of music?', choice_1: 'rock', choice_2: 'rap' } }

  redirect '/'
end

# submit completed survey
post '/submit' do
  p params
  params.each_value do |v|
    answer = Answer.find(v)
    answer.results.create
  end
  redirect '/'
end




