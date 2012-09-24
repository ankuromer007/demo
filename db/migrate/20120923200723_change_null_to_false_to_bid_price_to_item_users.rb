class ChangeNullToFalseToBidPriceToItemUsers < ActiveRecord::Migration
  def change
  	change_column :item_users, :bid_price, :decimal, :precision => 10, :scale => 2, null: false
  end
end
