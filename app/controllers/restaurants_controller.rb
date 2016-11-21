class RestaurantsController < ApplicationController

	@@apikey = "c908473802794c00d53a8e1446aa97f1"
  def index
  	if params[:location]
      location_name = params[:location]
      location = HTTParty.get("https://developers.zomato.com/api/v2.1/locations?query=#{location_name}&apikey=#{@@apikey}")
      location_id = location.parsed_response["location_suggestions"].first["entity_id"].to_i
      category = params[:category]
      @response = HTTParty.get("https://developers.zomato.com/api/v2.1/search?category=#{category}&entity_id=#{location_id}&entity_type=subzone&apikey=#{@@apikey}")
      @restaurants = @response["restaurants"]
  end
  end

  def show
  	@restaurant = HTTParty.get("https://developers.zomato.com/api/v2.1/restaurant?res_id=#{params[:id]}&apikey=#{@@apikey}")
  end
end
