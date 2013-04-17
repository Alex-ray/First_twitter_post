helpers do

  def twitter_oauth
    @twitter_oauth ||= TwitterOauth.new(session, to('/authorize_via_twitter/callback'))
  end


end
