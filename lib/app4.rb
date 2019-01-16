require 'twitter'
require 'dotenv'
Dotenv.load

def login_twitter
	client = Twitter::Streaming::Client.new do |config|
  	config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  	config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  	config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  	config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	end
	return client
end

def stream(login_twitter)
topics = "#bonjour_monde"
login_twitter.filter(track: topics) do |tweet|
	like_and_follow(tweet)
  puts tweet.text
end
end

def like_and_follow(tweet)
	client = Twitter::REST::Client.new do |config|
  	config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  	config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  	config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  	config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	end

  client.follow(tweet.user)
  client.fav tweet

end

def perform
	stream(login_twitter)
end

perform