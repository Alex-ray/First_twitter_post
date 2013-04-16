helpers do

  def twitter_oauth
    twitter_oauth ||= TwitterOauth.new(session, to('/authorize_via_twitter/callback'))
  end

  # def client
  #   @client ||= Twitter::Client.new(
  #     oauth_token: session[:oauth_token],
  #     oauth_token_secret: session[:oauth_secret]
  #   )
  # end

  # def consumer
  #   @consumer ||= OAuth::Consumer.new(
  #     ENV['CONSUMER_KEY'], 
  #     ENV['CONSUMER_SECRET'],
  #     {site: "https://api.twitter.com"}
  #   )
  # end

  # def request_token
  #   session[:request_token] ||= begin
  #     callback = to('/authorize_via_twitter/callback')
  #     consumer.get_request_token(oauth_callback: callback)
  #   end
  # end

  # def get_access_token oauth_verifier
  #   request_token.get_access_token(oauth_verifier: oauth_verifier)
  # end

  # def authorized_via_twitter?
  #   !!session[:oauth_secret]
  # end

end
