class CreateItemUsers < ActiveRecord::Migration
  def change
    create_table :item_users do |t|

    	t.references :item, :user, null: false
    	t.decimal :bid_price, :precision => 10, :scale => 2

      t.timestamps
    end

    add_index :item_users, [:item_id, :user_id]
    add_index :item_users, :bid_price
    add_foreign_key :item_users, :items
    add_foreign_key :item_users, :users
  end
end
