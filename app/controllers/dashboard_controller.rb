class DashboardController < ApplicationController

	before_filter :authenticate_user!

	def index
		dt = Time.now + 5.hours + 30.minutes
    @items = Item.where("user_id != ? AND deadline >= ?", current_user.id, dt ).page(params[:page]).order('deadline')

    @item_users = ItemUser.where("user_id = ?", current_user.id)

    @item_users.each do |item_user|
      ItemUser.where("item_id = ?", item_user.item_id).order('bid_price').first
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: { items: @items, item_users: @item_users } }
    end
  end
end
