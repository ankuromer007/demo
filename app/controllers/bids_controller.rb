class BidsController < ApplicationController

	before_filter :authenticate_user!

	def index
    @item_users = ItemUser.where("user_id = ?", current_user.id).page(params[:page]).order('created_at')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_users }
    end
  end

  def place_new
    @item = Item.find(params[:id])
    @bid_form = BidForm.new

    respond_to do |format|
      format.html # place_new.html.erb
      format.json { render json: { item: @item, bid_form: @bid_form } }
    end
  end

  def create
    @bid_form = BidForm.new(params[:bid_form])
    @item = Item.find(@bid_form.item_id)

    respond_to do |format|
      if @bid_form.valid?

        @item_user = ItemUser.new

        @item_user.item_id = @bid_form.item_id
        @item_user.user_id = @bid_form.user_id
        @item_user.bid_price = @bid_form.bid_price

        if @item_user.save
          format.html { redirect_to :action => 'index', notice: 'Bid was successfully placed.' }
          format.json { render json: @item_user, status: :created, location: @item_user }
        else
          format.html { render action: "new" }
          format.json { render json: @item_user.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: 'place_new' }
        format.json { render json: { item: @item, bid_form: @bid_form.errors }, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @item_user = ItemUser.find(params[:id])
    @item = Item.find(@item_user.item_id)
    @bid_form = BidForm.new

    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: { item: @item, bid_form: @bid_form, item_user: @item_user } }
    end
  end

  def update
    bid_form = BidForm.new(params[:bid_form])
    @item_user = ItemUser.find(bid_form.item_user_id)
    @item_user.bid_price = bid_form.bid_price

    respond_to do |format|
      if @item_user.update_attributes(params[:item])
        format.html { redirect_to :action => 'index', notice: 'Bid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_user = ItemUser.find(params[:id])
    @item_user.destroy

    respond_to do |format|
      format.html { redirect_to bids_url }
      format.js { render :nothing => true }
      #format.json { head :no_content }
    end
  end
end
