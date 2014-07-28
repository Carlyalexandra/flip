class HomesController < ApplicationController
  ENV['ZILLOW_ID']

  def index
  	@article_all = get_property
  	@article = ENV['ZILLOW_ID']
  end



 


  private

	  def get_property
	  	key = ENV['ZILLOW_ID']
		result = RestClient.get("http://www.zillow.com/webservice/GetComps.htm?zws-id=#{key}&zpid=48749425&count=5")
		house = Hash.from_xml result
	  	house["comps"]["message"]["text"]
	  end 

end
