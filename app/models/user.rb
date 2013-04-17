class User < ActiveRecord::Base
  has_many :tweets
  def tweet(status)
    tweet = Tweet.create(description: status)
    TweetWorker.perform_async(self.id, tweet.id)
  end
end
