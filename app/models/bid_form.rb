require "active_form"

class BidForm < ActiveForm

	attr_accessor :item_id, :user_id, :base_price, :bid_price, :item_user_id

	validates_presence_of :item_id, :user_id, :bid_price, :base_price
	validates :bid_price, :base_price, numericality: true
	validate :bid_price_must_be_greater_than_base_price

	def bid_price_must_be_greater_than_base_price
    errors.add(:bid_price, "must be greater than base price") unless
       self.bid_price > self.base_price
  end 
end