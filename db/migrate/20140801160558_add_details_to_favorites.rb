class AddDetailsToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :city, :string
    add_column :favorites, :state, :string
  end
end
