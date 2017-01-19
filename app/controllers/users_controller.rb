class UsersController < ApplicationController
  
  def index
      @trip = Trip.find(params[:trip_id])
      @invited_users = @trip.invited_users
  end

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:notice] = "You don't have permitions to edit other users' profiles."
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user && @user.update_attributes(user_params)
      redirect_to user_path(current_user), notice: "You profile was successfully updated!"
    else
      render :edit
    end
  end

  def create
  	@user = User.create(user_params) #or User.new
  	if @user.save
  		session[:user_id] = @user.id # to automatically log in a new user
  		flash[:notice] = "You have successfully signed up!"
  		redirect_to root_path
  	else
  		render :new, notice: "Please try again."
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :fact, :about, :places, :image, :password, :password_confirmation)
	end

end
