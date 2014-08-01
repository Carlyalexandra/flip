 class HomesController < ApplicationController
# require 'rubillow'


 def index
   query = params[:citystatezip].to_s
   unless query.blank?
    #@results = fetch_results(query)

     puts "query: #{query}"
     data = Indirizzo::Address.new(query)
     number = data.number.to_s
     street = data.street.first
     address = number + " " + street
     zip = data.zip
     if zip && address
      search = Rubillow::HomeValuation.search_results({ :address => address, :citystatezip => zip })
     end
     value = search.zpid 
     @results = Rubillow::HomeValuation.zestimate({ :zpid => value }) if value
     @compares = Rubillow::PropertyDetails.deep_comps({ :zpid => value, :count => 10 }) if value
   end
 end


  def main
  
  end
 
  def favorites
    if current_user
     @favorites = current_user.favorites
    else
      flash[:alert] = "You must log in store favorites"
    end
  end


  private

  # def search_params
  # 	params.require(:user).permit(:citystatezip)
  # end


  #posts in a specific area
  data = Rubillow::Postings.region_postings({ :zipcode => "" })
  if data.success?
        data.make_me_move.each do |posting|
         puts posting.price
         puts posting.address[:street]
         end
     end

  #Get the id of the properties/compare to similiar properties
  	data = Rubillow::HomeValuation.search_results({ :address => '', :citystatezip => '' })
    if data.success?
      puts data.zpid     
      puts data.price  
    end

  compares = Rubillow::PropertyDetails.deep_comps({ :zpid => '', :count => 10 }) #or
    if compares.success?
        puts compares.principal.price 
        compares.comparables.each do |comp|
          puts comp.last.price
          puts comp.last.address[:street]
          puts comp.last.last_sold_price
        end
      end

#Price change equaion
 data = Rubillow::HomeValuation.zestimate({ :zpid => '' })
 if data.success?
        puts data.zpid          
        puts data.price         
        puts data.value_change  
 end
  
  #price the property was last sold for
  data = Rubillow::PropertyDetails.deep_search_results({ :address => '', :citystatezip => '' })
  if data.success?
       puts data.last_sold_price       
  end

 #price difference for the property since it was last sold
 property = Rubillow::HomeValuation.zestimate({ :zpid => '48749425' })
	if property.success?
	  puts property.price
	  puts property.change
 	end

#Chart that shows change
 chart = Rubillow::HomeValuation.chart({ :zpid => '', :height => '300', :width => '150', :unit_type => 'dollars' })
	if chart.success?
        puts chart.to_html
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