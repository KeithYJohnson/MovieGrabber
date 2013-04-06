require 'test/unit'
require 'rack/test'
require_relative '../movie_server'

class MovieServerTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	def test_welcome_page
		get '/'
		assert last_response.ok?
		#will return true is HTTP response is 200
	end

	def test_missing_name_redirects_home
		post '/film', {}
		#If I forget to put a name in and the params is empty
		follow_redirect!
		#In a redirect the server sends in the response a 302 message with a new URL
		# After the client gets this response, a new request is made, and the then a 200 ok
		assert last_response.redirect_to '/'

	end


end

