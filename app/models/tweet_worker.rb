class TweetWorker

  include Sidekiq::Worker

  def perform(user_id,tweet_id)
    user = User.find(user_id)
    tweet = Tweet.find(tweet_id)
    tweet.user = user
    tweet.save!

    # set up Twitter OAuth client here
    # actually make API call
    # Note: this does not have access to controller/view helpers
    # You'll have to re-initialize everything inside here

    @client ||= Twitter::Client.new(
      oauth_token: @session[:oauth_token],
      oauth_token_secret: @session[:oauth_secret]
    )

    client.update(tweet.description)
  end
end
