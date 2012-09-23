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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
end
