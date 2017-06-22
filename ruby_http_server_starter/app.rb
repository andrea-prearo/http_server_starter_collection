require 'sinatra'

get '/' do
  content_type :json
  { :message => 'Hello Ruby!', :success => true }.to_json
end
