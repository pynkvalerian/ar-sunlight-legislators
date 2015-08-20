require 'twitter'
require 'byebug'

class TwitterAccess
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "6bMMl7UDOTjvq6Vfjnyd0j1Bo"
      config.consumer_secret     = "XgUXpZvNw0fjJhiGWHGMoGIg945KrPTDyQzOUq6kcjtyGcEzll"
      config.access_token        = "612492229-kC4Q3YxNW13T9MpKM9E5P09eXvJHomEfLJ0aivM5"
      config.access_token_secret = "IZquwL9qepLAvOBwuvYPfkNyuwWrQ2yj8omfR5PluwQk4"
    end
  end

  def fetch_tweet_for(senator)
    tweet_id = client.user_timeline(senator, count: 1)
    tweet = tweet_id[-1].text
    return tweet
  end
end


# tweet = TwitterAccess.new
# tweet.fetch_tweet_for("pingthedreamer")

# client.user_timeline("pingthedreamer")