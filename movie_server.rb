require 'sinatra'
require 'pry'
require 'rack-flash'
require 'rubygems'
require 'shotgun'

require_relative 'movies'

enable :sessions
use Rack::Flash	


get '/' do
	erb :login	
end

	

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

  @newmovie = Movie.get_film_info(params[:name].gsub(" ","%20"))
  


  erb :movie, :locals => {
  	:newmovie => @newmovie
  }
  

end