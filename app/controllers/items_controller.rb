class ItemsController < ApplicationController

	before_filter :authenticate_user!

	def index
    ItemStatus.update
    
    @items = Item.where("user_id = ?", current_user.id).page(params[:page]).order('deadline')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  def create
    @item = Item.new(params[:item])
    @item.user_id = current_user.id


    respond_to do |format|
      if @item.save
        format.html { redirect_to :action => 'index', notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to items_path, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.js { render :nothing => true }
      #format.json { head :no_content }
    end
  end

  def images
  	item = Item.find(params[:id])
  	style = params[:style] ? params[:style] : 'original'
  	send_data item.image.file_contents(style), :type => item.image_content_type
  end
end
