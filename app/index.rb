require 'slim'
require 'less'

require 'sinatra'

get '/stylesheets/:style.css' do
  less(params[:style].to_sym)
end

get '/' do
  slim(:index)
end

