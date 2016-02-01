class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
class ItemsController < ApplicationController
	def index
		@items = Item.all
		render :index
	end

	def new
		@item = Item.new
		render :new
	end

	def create
		item_params = params.require(:item).permit(:name,:description)
		item = Item.new(item_params)
		if item.save
			redirect_to item_path(item)
		end
	end

	def show
		item_id = params[:id]
		@item =Item.find_by_id(item_id)
		render :show
	end
end


