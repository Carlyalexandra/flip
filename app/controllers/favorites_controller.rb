class FavoritesController < ApplicationController

	def create
	     Favorite.create(favorite_params)
	end

	def destroy
	end

	private
	def favorite_params
		params.require(:user).permit(:zpid, :link, :last_sold_date, :last_sold_price, :price, :address)
	end

end
