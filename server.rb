require 'sinatra'
require 'sinatra/reloader'

enable :sessions

get '/' do
	@email = session[:current_user] || "User"
	erb :home
end

get '/login' do 
	if session[:current_user].nil?
		erb :login
	else
		redirect '/'
	end
end

post '/login' do 
	@email = params[:user_email]
	@pass = params[:user_password]

	if @email == "josh@ironhack.com" && @pass == "swordfish"
		session[:current_user] = @email
		redirect "/"
	else
		redirect "/login"
	end
end