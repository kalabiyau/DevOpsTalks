require 'slim'
require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
  slim(:index)
end

