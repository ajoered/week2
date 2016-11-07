require 'sinatra'
require 'haml'
require 'pry'
require "sinatra/reloader" if development?
require_relative 'lib/movie.rb'


set :haml, format: :html5
enable(:sessions)

get '/' do
  erb(:index)
end

post '/search' do 
	session[:url] = ImdbExtract.get_posters(params[:search])
	#session[:url] = @url
	redirect to('/results')
end

get '/results' do
	@url = session[:url]
	erb(:results)
end



