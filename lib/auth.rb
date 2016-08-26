require 'twitter'
require 'yaml'

token = YAML::load_file('./config/twitter.yml') #Load

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = token["Second"]["consumer_key"]
  config.consumer_secret     = token["Second"]["consumer_secret"]
  config.access_token        = token["Second"]["access_token"]
  config.access_token_secret = token["Second"]["access_token_secret"]
end
