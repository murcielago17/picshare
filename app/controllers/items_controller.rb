class ItemsController < ApplicationController
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

  
end
