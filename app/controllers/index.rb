enable :sessions

# GET ====================================

get '/' do
  # Look in app/views/index.erb
  if current_user
    redirect "/user/#{session[:user_id]}"
  else
    erb :index
  end
end


get '/create' do
  if current_user
    erb :create
  else
    @errors = "You must be logged in to do that."
    erb :index
  end
end

get '/logout' do
  session.clear
  erb :index
end

get '/survey/:survey_id' do
  survey_id = params[:survey_id]
  @survey = Survey.find_by_url(survey_id)
  @questions = @survey.questions  
  erb :survey
end


get '/user/:user_id' do
  if current_user
    user_id = params[:user_id]
    @surveys = Survey.where("user_id = #{user_id}")
    erb :profile
  else
    @errors = "You must be logged in to do that."
    erb :index
  end
end


get '/user/:user_id/survey/:survey_id' do
  if current_user
    survey_id = params[:survey_id]
    @survey = Survey.find(survey_id)
    @questions = @survey.questions  
    erb :results
  else
    @errors = "You must be logged in to view these survey results."
    erb :index
  end
end

get '/survey/:survey_url/success' do
  erb :success
end

# POST ====================================

post '/login' do
  email = params[:email]
  password = params[:password]
  user = User.find_by_email(email)
  if user.password == password
    session[:user_id] = user.id
    redirect "/user/#{user.id}"
  else
    @errors = "Username and password do not match."
    erb :index
  end
end

post '/signup' do
  email = params[:email]
  password = params[:password]
  user = User.create({email: email, password: password})
  if user.errors == []
    @signup_errors = "Email " + (user.errors.first)[1]
    erb :index
  else
    session[:user_id] = user.id
    redirect "/user/#{user.id}"
  end
end

# create new survey
post '/create' do
  if current_user
    params_hash = params
    survey_title = params_hash[:survey][:title]
    # create a new survey
    survey = current_user.surveys.create( { title: survey_title, url: make_url } )
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
    redirect "/survey/#{survey.url}"

  else
    redirect "/"
  end
end

# submit completed survey
post '/submit' do
  params.each_value do |v|
    answer = Answer.find(v)
    answer.results.create
  end
  survey_id = Question.find(params.first[0]).survey_id
  @survey = Survey.find(survey_id)
  redirect "/survey/#{@survey.url}/success"
end




