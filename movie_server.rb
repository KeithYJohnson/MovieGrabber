require 'sinatra'
require 'pry'
require_relative 'movies'

get '/' do
	erb :index
end

get "/:name" do
	erb :movie
end


post '/film' do
  # Search for a Movie
  # HINT - what is in params ?
  newmovie = Movie.get_film_info(params[:name])
  
  @actors = newmovie.actors
  #binding.pry
 #   @actors=
 #  ["Roy Scheider", " Robert Shaw", " Richard Dreyfuss", " Lorraine Gary"],
 # @director="Steven Spielberg",
 # @genre="Adventure, Horror, Thriller",
 # @plot=
 #  "When a gigantic great white shark begins to menace the small island community of Amity, a police chief, a marine scientist and grizzled fisherman set out to stop it.",
 # @poster_url=
 #  "http://ia.media-imdb.com/images/M/MV5BOTUwMzY4NzI4Nl5BMl5BanBnXkFtZTcwMDgzNjk3OA@@._V1_SX300.jpg",
 # @rating=nil,
 # @title="Jaws",
 # @year="1975">
  redirect "/#{params[:name]}"

  # Display the movie in the page
end