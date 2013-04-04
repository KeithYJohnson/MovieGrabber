require 'sinatra'
require 'pry'
require_relative 'movies'

get '/' do
	erb :index
end

get "/:name" do
	
	erb :movie

	# erb :movie, :locals => {
 #  	:actors => @actors
 #  }

end


post '/film' do
  # Search for a Movie
  # HINT - what is in params ?
  newmovie = Movie.get_film_info(params[:name])
  
  @actors = newmovie.actors

  erb :movie, :locals => {
  	:actors => @actors
  }


 # @year="1975">
  #redirect "/#{params[:name]}"

  # Display the movie in the page
end