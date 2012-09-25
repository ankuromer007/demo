module ItemStatus	
	def self.update
    dt = Time.now + 5.hours + 30.minutes
    @items = Item.all

    @items.each do |item|

      if item.deadline <= dt
        item.status = 1

        user_id = ItemUser.where("item_id = ?", item.id).order("bid_price").last

        if !user_id.nil?
          item.buyer_id = user_id
        end 

        item.save
      end
    end
  end
end