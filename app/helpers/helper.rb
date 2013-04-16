def create_consumer
  OAuth::Consumer.new(
    ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'],
    :site => "https://api.twitter.com")
end
