require 'sinatra'
require 'haml'
require 'pry'
require "sinatra/reloader" if development?
require_relative 'lib/user.rb'
require_relative 'lib/twit.rb'

set :haml, format: :html5
enable(:sessions)

@@users ||= []
@@twits ||= []


get '/' do
  erb(:index)
end

get '/login' do
	erb(:login)
end

get '/register' do
	erb(:register)
end

post '/register_form' do
	@user = User.new(params[:username], params[:password])
	@invalid = @@users.find { |user| user.name == params[:username] && user.password == params[:password] }
	session[:username] = params[:username]
	session[:logged_in] = true
	if @invalid
		@error = "This email is already registered, please log in or enter a different email"
		erb(:register)
	else
		@@users << @user
		redirect to "/profile"
	end
end


post '/login_form' do
	@error = "You are not in our system. Please register!"
	valid = @@users.find { |user| user.name == params[:username] && user.password == params[:password] }
	if valid
		session[:username] = params[:username]
		session[:logged_in] = true
		redirect to('/profile')
	else
		@error
		erb(:login)
	end
end

get '/profile' do
  @twits_to_print = @@twits.select {|twit| twit.user == session[:username]}
  erb(:profile)
end

get "/logout" do
  session[:logged_in] = false
  redirect to("/")
end

post '/crear_twit' do
	@@twits << Twit.new(params[:message], session[:username])
  	redirect to("/profile")
end

