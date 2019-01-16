require 'twitter'
require 'dotenv'
Dotenv.load

def login_twitter
 
	client = Twitter::REST::Client.new do |config|
  	config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  	config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  	config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  	config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	end

client.search("#bonjour_monde").take(20).each do |tweet|
   client.follow(tweet.user)

end
end

login_twitter