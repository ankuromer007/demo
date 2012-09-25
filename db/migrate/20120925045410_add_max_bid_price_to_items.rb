class AddMaxBidPriceToItems < ActiveRecord::Migration
  def change
  	add_column :items, :max_bid_price, :decimal, :precision => 10, :scale => 2, default: 0.0
  end
end
