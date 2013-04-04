require 'sinatra'
require 'pry'
require 'rack-flash'
require 'rubygems'
require 'shotgun'

require_relative 'movies'

enable :sessions
use Rack::Flash	

# before '/' do

# 	unless params[:password] == "coolbananas"
# 		flash[:notice] = "Sorry, the password is wrong."
# 		redirect '/login'
# 	end
# end

get '/' do

	erb :login
	
end
	# unless params[:password] == "coolbananas"
	# 	redirect '/login'
	# ene
	

get "/:name" do
	erb :movie
end

get '/login' do
	erb :login
end 



post '/' do
	if params[:password] == "coolbananas"
		erb :index
	else
		redirect '/'
	end
end

post '/film' do

  newmovie = Movie.get_film_info(params[:name])
  
  @actors = newmovie.actors

  erb :movie, :locals => {
  	:actors => @actors
  }


end