require "tweetstream"
require "mongo"
require "time"

TweetStream.configure do |config|
  config.consumer_key       = ''
  config.consumer_secret    = ''
  config.oauth_token        = ''
  config.oauth_token_secret = ''
  config.auth_method        = :oauth
end

ONLY = %w{created_at text geo coordinates place user id_str}

db = Mongo::Connection.new("localhost", 27017).db("crowdflow")
tweets = db.create_collection("tweets")
#
#TweetStream::Client.new.locations(-118.40764955087901,14.532098361948284,-86.71040527005668,32.71865357526207) do |status|
TweetStream::Daemon.new.locations(-118.40764955087901,14.532098361948284,-86.71040527005668,32.71865357526207) do |status|
    data = status.to_h.select{|k,v| ONLY.include?(k.to_s)}
    #data = status.to_h
    id = tweets.insert(data)
end