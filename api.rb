#!/usr/bin/env ruby

require 'sinatra' # gem install sinatra
require 'json'

# Accessible via http://localhost:4567

get '/' do
  content_type :json
  File.read("./Data/nike.json")
end


get '/frequency' do
  content_type :json
  File.read('./Data/nikefrequency.json')
end


not_found do
  erb "Page not found"
end
