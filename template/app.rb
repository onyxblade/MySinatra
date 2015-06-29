require 'sinatra'
require "active_record"
require 'sqlite3'

%w{lib controllers models}.each do |path|
  Dir[File.dirname(__FILE__) + "/#{path}/*.rb"].each {|file| require file }
end

set :run, false

get '/' do
  'Hello World.'
end