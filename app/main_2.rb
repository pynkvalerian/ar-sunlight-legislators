require_relative '../db/config'
require_relative './models/congress_members'
require_relative './models/twitter'
require 'byebug'


tweet = TwitterAccess.new

tweetss = []

congress = CongressMember.all
congress.each do |value|
  if value[:twitter_id].nil?
    next
  else
    hash = {}
    hash["name"] = (value[:first_name] + " " + value[:last_name])
    hash["twitter_ids"] = value[:twitter_id]
    tweetss << hash
  end
end


tweetss.each do |person|
  puts "#{person["name"]}"
  byebug
  tweets = tweet.fetch_tweet_for(person["twitter_ids"])
  puts tweets
end

