class ItemsController < ApplicationController
	
	def index
		@items = Item.all
		render :index
	end

	def new
		@item = Item.new
		render :new
	end

	def show
    item_id = params[:id]
    @item = Item.find_by_id(item_id)
    render :show
  end

  def create
    item_params = params.require(:item).permit(:name, :description)
    item = Item.new(item_params)
    if item.save
      redirect_to item_path(item)
    end
  end

  def edit
  	item_id = params[:id]
  	@item = Item.find_by_id(item_id)
  	render :edit
  end

  def update
  	item_id = params[:id]
  	item = Item.find_by_id(item_id)
  	item_params = params.require(:item).permit(:name, :description)
  	item.update_attributes(item_params)
  	redirect_to item_path(item)
  end

  def destroy
  	item_id = params[:id]
  	item = Item.find_by_id(item_id)
  	item.destroy
  	redirect_to items_path
  end


end
