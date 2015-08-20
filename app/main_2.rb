require_relative '../db/config'
require_relative './models/congress_members'
require_relative './models/twitter'


tweet = TwitterAccess.new

tweetss = []
# p "sdbdh"
congress = CongressMember.all
congress.each do |value|
  hash = {}
  hash["name"] = (value[:first_name] + " " + value[:last_name])
  hash["twitter_ids"] = value[:twitter_id]
  tweetss << hash
end
# p tweetss.length

# tweetss.each do |person|
#   puts "#{person["name"]}"
#   tweets = tweet.fetch_tweet_for(person["twitter_id"])
#   puts tweets
# end

