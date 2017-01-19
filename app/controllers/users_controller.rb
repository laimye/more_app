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
      flash[:notice] = "Welcome to More. It's nice to meet you!"
      redirect_to root_path
    else
      render :new, notice: "Please try again."
    end
  end

  def like
    current_user.like!(params[:post_id]) unless current_user.like?(params[:post_id])
    redirect_to post_path(params[:post_id])
  end

  def unlike
    current_user.unlike!(params[:post_id]) if current_user.like?(params[:post_id])
    redirect_to post_path(params[:post_id])
  end

	private

	def user_params
		params.require(:user).permit(:name, :email, :fact, :about, :places, :image, :password, :password_confirmation)
	end

end
