Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require_relative 'helper/save'

require 'json'

tweets = search("pokemongo", "en", 30)
path = store(tweets)
geo  = geocode(path)
done = analyse(geo)
stat = status(done)
clean = words(stat)
count(clean)
