
URI_REGEX = %r"((?:(?:[^ :/?#]+):)(?://(?:[^ /?#]*))(?:[^ ?#]*)(?:\?(?:[^ #]*))?(?:#(?:[^ ]*))?)"

def search(keyword,lang="en",num)
  @file = "./Data/#{keyword}.json"
  tweets = []
    @client.search(keyword, lang: lang, result_type: "recent").take(num).collect do |tweet|
        tweets <<  "#{tweet.user.name} ² #{tweet.text} ² #{tweet.user.location}
                  ² #{tweet.created_at} ² #{tweet.retweet_count}"
    end
  return tweets
end

def remove_uris(text)
  text.split(URI_REGEX).collect do |s|
    unless s =~ URI_REGEX
      s
    end
  end.join
end

def store(tweets)
  clean = []
  tweets.each do |t|
    clean <<  remove_uris(t)
  end

  data = []
    clean.each do |c|
      if c.split('²')[2] != ' '
      data  << {
      :name          =>   c.split('²')[0].strip,
      :text          =>   c.split('²')[1].strip,
      :location      =>   c.split('²')[2].strip,
      :created_at    =>   c.split('²')[3].strip,
      :retweet_count =>   c.split('²')[4].strip
      }
    end
  end
  save(@file , data)
end
