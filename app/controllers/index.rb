# GET ====================================

get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/create' do

  erb :create
end

get '/survey/:survey_id' do

  erb :survey
end


get '/user/:user_id' do


  erb :profile
end


get '/user/:user_id/survey/:survey_id' do


  erb :results
end



# POST ====================================

post '/login' do

  redirect '/user/1'
end

post '/signup' do

  redirect '/'
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
