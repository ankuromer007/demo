class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

    	t.string :name, null: false
    	t.text :description
    	t.has_attached_file :image
    	t.integer :base_price, null: false
    	t.timestamp :deadline, null: false
    	t.boolean :status, null: false, default: false

    	t.references :user, null: false

      t.timestamps
    end

    add_index :items, :name
    add_index :items, :deadline
    add_index :items, :status
    add_index :items, [:name, :base_price, :deadline], unique: true

    add_foreign_key :items, :users

  end
end
