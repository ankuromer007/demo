class DashboardController < ApplicationController

	before_filter :authenticate_user!

	def index
    ItemStatus.update

    @items = Item.where("user_id != ? AND status = ?", current_user.id, 0).page(params[:page]).order('deadline')

    @item_users = ItemUser.where("user_id = ?", current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: { items: @items, item_users: @item_users } }
    end
  end
end
