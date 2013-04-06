require 'sinatra'
require 'pry'
require 'rack-flash'
require 'rubygems'
require 'shotgun'
require 'sinatra/flash'
require 'sqlite3'

require_relative 'movies'

enable :sessions
use Rack::Flash	


get '/' do
	erb :login, :layout => false
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
		flash[:notice] = "Your bananas are too hot!!  Please follow the IMDB twitter account for the password to use this website"
		redirect '/'
	end
end


post '/film' do 

  #To get the empty string test to work, test for nil class and " " empty string

  db = SQLite3::Database.new("movies.db")

  @newmovie = db.execute("select * from movies where title = '#{params[:name]}'")
  if @newmovie.length > 0 	
  	puts "Cache HIT"
  	erb :movie, :locals => {:newmovie => @newmovie}
  													#each key will become a local variable in your template
  													#can be accessed with the <% <key> %> syntax
  		#same as({:locals => {:cool_bananas => @user}})
  	#Remember that :movie, is a symbol representing the template :movie
  	# Use the film info from the database
  else
  	puts "Cache MISS"

  	# Lookup the film information on the web
    @newmovie = Movie.get_film_info(params[:name].gsub(" ","%20"))

    # store the film in the database
    @newmovie.save
    erb :movie, :locals => {:newmovie => @newmovie}
  end
		
	  # @newmovie = Movie.get_film_info(params[:name].gsub(" ","%20"))
	  
	  # erb :movie, :locals => {:newmovie => @newmovie}

  

end