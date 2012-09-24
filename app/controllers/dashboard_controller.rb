class DashboardController < ApplicationController

	before_filter :authenticate_user!

	def index
		dt = Time.now + 5.hours + 30.minutes
    @items = Item.where("user_id != ? AND deadline >= ?", current_user.id, dt ).page(params[:page]).order('deadline')
    #@items.sort! { |a,b| a.deadline <=> b.deadline }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end
end
