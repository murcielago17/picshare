class ItemsController < ApplicationController
	# before_action :get_item_id, only: [:show, :edit, :update, :destroy]

 #  def get_item_id
 #    item_id = params[:id]
 #  end
    
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
    user_id = params[:id]
    @item = Item.find_by_id(item_id)
    @user = User.find_by_id(user_id)
    render :show
  end

  def create
    item_params = params.require(:item).permit(:name, :description, :image_url)
    item = Item.new(item_params)
    if item.save
      redirect_to item_path(item)
    end
  end

  def edit
  	item_id = params[:id]
  	@item = Item.find_by_id(item_id)
    if session[:user_id] != @user.user_id
      flash[:notice] = "Sorry, only the owner can change this item"
      redirect_to(items_path)
    else
  	render :edit
    end
  end

  def update
  	item_id = params[:id]
  	@item = Item.find_by_id(item_id)
  	@item_params = params.require(:item).permit(:name, :description, :image_url)
  	@item.update_attributes(item_params)
  	redirect_to item_path(item)
  end

  def destroy
  	item_id = params[:id]
  	@item = Item.find_by_id(item_id)
  	@item.destroy
  	redirect_to items_path
  end


end
