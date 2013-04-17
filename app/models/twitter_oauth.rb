class TwitterOauth

  def initialize(session, callback_url)
    @session = session
    @callback_url = callback_url
  end

  def client
    @client ||= Twitter::Client.new(
      oauth_token: @session[:oauth_token],
      oauth_token_secret: @session[:oauth_secret]
    )
  end

  def consumer
    @consumer ||= OAuth::Consumer.new(
      ENV['TWITTER_KEY'], 
      ENV['TWITTER_SECRET'],
      {site: "https://api.twitter.com"}
    )
  end

  def request_token
    @session[:request_token] ||= begin
      consumer.get_request_token(oauth_callback: @callback_url)
    end
  end

  def get_access_token oauth_verifier
    request_token.get_access_token(oauth_verifier: oauth_verifier)
  end

  def authorized?
    !!@session[:oauth_secret]
  end

  def authorize_url
    request_token.authorize_url
  end

  def update *args
    client.update(*args)
  end

  def complete! params
    access_token = get_access_token(params["oauth_verifier"])
    @session[:oauth_token] = access_token.token
    @session[:oauth_secret] = access_token.secret
  end

end
