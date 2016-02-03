class UsersController < ApplicationController

  def index
    @users = User.all
  end
	def new
    @user = User.new
	end

	def create
    puts user_params
		user = User.new(user_params)
    puts user
    if user.save!
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
	end
   def show
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    @items =  @user.items
    render :show

   end


private 
	def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

end
