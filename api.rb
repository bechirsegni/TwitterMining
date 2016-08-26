#!/usr/bin/env ruby

require 'sinatra' # gem install sinatra
require 'json'

# Accessible via http://localhost:4567

get '/' do
  "open json file by typing the name in the browser & /f/filename to get the frequency data"
end

get '/:file' do
      @file = params['file']
      content_type :json
      File.read("./Data/#{@file}.json")
end

get '/f/:file' do
  @file = params['file']
  content_type :json
  File.read("./Data/#{@file}frequency.json")
end


not_found do
  erb "Page not found"
end
