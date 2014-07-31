class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.integer :zpid
      t.string :link
      t.datetime :last_sold_date
      t.integer :last_sold_price
      t.integer :price
      t.string :address
      t.string :zip

      t.timestamps
    end
  end
end
