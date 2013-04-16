get '/' do
  if twitter_oauth.authorized?
    erb :tweet
  else
    erb :index
  end
end

post '/tweet/new' do
  tweet = twitter_oauth.update(params[:tweet][:text])
  if tweet
    tweet.text
  else
    status 500
    "something bad happened :("
  end
end

post '/authorize_via_twitter' do
  redirect twitter_oauth.authorize_url
end

get '/authorize_via_twitter/callback' do
  twitter_oauth.complete! params
  redirect "/"
end
