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
  # create a new survey
  # for each question



    # make a new question for the survey



# SAMPLE PARAMS
# { "survey" => { title: "Favorite Colors" },
#   "question_1" => { content: 'Your favorite color?', choice_1: "red", choice_2: "green" },
#   "question_2" => { content: 'Your favorite kind of music?', choice_1: 'rock', choice_2: 'rap' } }


  redirect '/'
end

# submit completed survey
post '/submit' do

 redirect '/'
end




