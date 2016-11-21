class HomeController < ApplicationController

	@@apikey = "c908473802794c00d53a8e1446aa97f1"

	def index
		@response = HTTParty.get("https://developers.zomato.com/api/v2.1/categories?apikey=#{@@apikey}")
		@categories_hash = @response.parsed_response["categories"]
		@categories = []
		@categories_hash.each do |hash|
		@categories.push(hash["categories"]["name"])
		end
	end

	def show

	end
end
