class AddBuyerToItems < ActiveRecord::Migration
  def change
  	add_column :items, :buyer_id, :integer, default: 0
  end
end
