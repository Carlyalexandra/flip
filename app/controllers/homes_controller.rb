class HomesController < ApplicationController
# require 'rubillow'


  def index
 
  end


  def main

  end
 


  private
 
 	property = Rubillow::HomeValuation.zestimate({ :zpid => '48749425' })
	if property.success?
	  puts property.price
	  p property.address[:latitude]
	  puts property.change
 	end
	 

end



#  def get_property
	 #  	key = ENV['ZILLOW_ID']
		# result = RestClient.get("http://www.zillow.com/webservice/GetComps.htm?zws-id=#{key}&zpid=48749425&count=5")
		# house = Hash.from_xml result
		# collection = []
	 #    house["comps"]["response"]["properties"]["principal"]["zestimate"]["amount"]
	 #  	house["comps"]["response"]["properties"]["comparables"]
	 #  	# .each_key do |key|
	 #  	# 	collection << {key: ["comp"]["link"], key: ["comp"]["zestimate"]["amount"]}
	 #  	# end
	 #  	# collection 

	 #  end 