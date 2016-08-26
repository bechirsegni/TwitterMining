require_relative '../helper/stopwords.rb'

def status(path)
  words   = []
  data    = JSON.parse( IO.read(path, encoding:'utf-8') )
  data.each do |object|
    words << object["text"].gsub!(STOPWORDS, '')
    words << object["text"].gsub!(/\B[@#]\S+\b/, '')
  end

  @fname  = path.split('/')[2].split(".").first
  file_path   = "./Data/#{@fname}text.txt"

  File.open(file_path, "w+") do |f|
    words.each { |element| f.puts(element) }
  end
  return file
end

def words(file)
  @file_frequency = "./Data/#{@fname}frequency.txt"
  frequency = Hash.new(0)
  input_file = File.open(file, 'r')
  output_file = File.open(@file_frequency, 'w')

  input_file.read.downcase.scan(/\b[a-z]{3,16}\b/) {|word| frequency[word] = frequency[word] + 1}
  frequency.keys.reverse.each{|key| output_file.print key,' => ',frequency[key], "\n"}

  File.delete(file)
  @file_frequency
  return frequency
end

def count(data)
  sorted = data.sort_by {|_key, value| value}.reverse.to_h
  final_data = sorted.to_json
  File.open(@file_frequency,"w") do |f|
    f.write(final_data)
  end
  File.delete(@file_frequency)
end
