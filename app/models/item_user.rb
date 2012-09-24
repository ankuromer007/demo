class ItemUser < ActiveRecord::Base

	attr_accessible :item_id, :user_id, :bid_price

	validates_presence_of :item_id, :user_id, :bid_price
	validates :bid_price, numericality: true

	belongs_to :item
  belongs_to :user

end
