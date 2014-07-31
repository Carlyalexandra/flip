class FavoritesController < ApplicationController

	def create
	  favorite = Favorite.new(favorite_params)
	  favorite.user = current_user
	  	if favorite.save
			flash[:notice] = "Favorite added."
			redirect_to favorites_path
		else
			flash[:notice] = "Something went wrong."
			redirect_to favorites_path
		end
	end

	def destroy
	 fav = Favorite.find(params[:id])
     fav.delete
     redirect_to favorites_path
	end

	private
	def favorite_params
		params.require(:favorite).permit(:zpid, :link, :last_sold_date, :last_sold_price, :price, :address, :zip)

	end

end
