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
  @surveys = Survey.where("user_id =#{user_id}")

  erb :profile
end


get '/user/:user_id/survey/:survey_id' do


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

post '/create' do

  redirect '/'
end

post '/submit' do

 redirect '/'
end







# Return the total number of responses to a question
# @number_of_responses = survey.questions.first.results.count


# Return the percentage for a particular answer
# answer_results = answer.results.count
# total_results = answer.question.results.count
# answer_percentage = ((answer_results.to_f / total_results) * 100).round
