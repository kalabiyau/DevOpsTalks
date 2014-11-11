require 'slim'

require 'sinatra'

get '/' do
  slim(:index)
end

