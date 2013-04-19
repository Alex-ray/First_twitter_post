get '/' do
  if twitter_oauth.authorized?
    erb :tweet
  else
    erb :index
  end
end

get '/logout' do
  logout
  redirect to "/"
end

post '/tweet/new' do
  tweet = Tweet.create(description: params[:tweet][:text],
    user: User.find(session[:user_id]))
  return tweet.id
  job_id = TweetWorker.perform_async(@session[:user_id], tweet.id)
  return job_id
  if job_id
    job_id
  else
    501
  end
end

post '/authorize_via_twitter' do
  redirect twitter_oauth.authorize_url
end

get '/authorize_via_twitter/callback' do
  twitter_oauth.complete! params
  redirect "/"
end

get '/status/:job_id' do
  puts job_is_complete(params[:job_id])
  if job_is_complete(params[:job_id])
    return "done"
  else
    return "running"
  end
    "failed"
end
