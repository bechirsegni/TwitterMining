require 'sentimental'

def analyse(path)
  analyzer = Sentimental.new
  analyzer.load_defaults

  data = JSON.parse( IO.read(path, encoding:'utf-8') )
  final = []
    data.each do |d|
   final << d.merge(sentiment: analyzer.sentiment(d['text']) , score: analyzer.score(d['text']) )
  end
  save(path, final)
end
