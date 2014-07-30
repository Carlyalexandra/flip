class AddDetailsToHomes < ActiveRecord::Migration
  def change
    add_reference :homes, :user, index: true
    add_column :homes, :zpid, :integer
    add_column :homes, :link, :string
    add_column :homes, :last_sold_price, :integer
    add_column :homes, :last_sold_date, :datetime
    add_column :homes, :price, :integer
    add_column :homes, :address, :string
    add_column :homes, :city, :string
  end
end
