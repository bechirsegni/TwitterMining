require 'stopwords'

STOPWORDS = /\b(?:#{ %w[to and or the you our a RT amp are https nil].join('|') })\b/i

def status(path)
  words = []
  data = JSON.parse( IO.read(path, encoding:'utf-8') )
  data.each {|object| object["text"].gsub!(STOPWORDS, '')}
  data.each {|object| words << object["text"].gsub!(/\B[@#]\S+\b/, '')}

  filter = Stopwords::Snowball::Filter.new "en"
  clean  = filter.filter words.to_s.split

  @fname = path.split('/')[2].split(".").first

  File.open("./Data/#{@fname}text.txt", "w+") do |f|
    clean.each { |element| f.puts(element) }
  end
  path = "./Data/#{@fname}text.txt"
end

def words(file)
  frequency = Hash.new(0)
  input_file = File.open(file, 'r')
  output_file = File.open("./Data/#{@fname}frequency.txt", 'w')
  input_file.read.downcase.scan(/\b[a-z]{3,16}\b/) {|word| frequency[word] = frequency[word] + 1}
  frequency.keys.reverse.each{|key| output_file.print key,' => ',frequency[key], "\n"}
  File.delete(file)
  @ftext = "./Data/#{@fname}frequency.txt"
  return frequency
end

def count(data)
  sorted = data.sort_by {|_key, value| value}.reverse.to_h
  final_data = sorted.to_json
  File.open("./Data/#{@fname}frequency.json","w") do |f|
    f.write(final_data)
  end
  File.delete(@ftext)
end
