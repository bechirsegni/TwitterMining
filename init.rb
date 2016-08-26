#!/usr/bin/env ruby

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require_relative 'helper/save'

require 'json'
require 'benchmark'

Benchmark.bm do |bm|
  bm.report {
  tweets = search("Samsung", "en", 5)
  path = store(tweets)
  stat = status(path)
  clean = words(stat)
  count(clean)
  geo  = geocode(path)
  analyse(geo)}
end
