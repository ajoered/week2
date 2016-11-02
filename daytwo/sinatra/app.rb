require 'sinatra'
require 'haml'

require "sinatra/reloader" if development?

set :haml, format: :html5
enable(:sessions)

get '/' do
  session[:twits] = []
  erb(:index)
end

post '/crear_twit' do
	session[:twits] << params[:message]
	redirect to "/"
end