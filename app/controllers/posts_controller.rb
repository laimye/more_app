class PostsController < ApplicationController
  
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		if params[:sort]
			@posts = Post.order(params[:sort])
		else
			@posts = Post.all
		end
	end

	def show
		@comment = Comment.new
	end

	def edit
		unless current_user == @post.user
		  redirect_to :back, notice: 'You are not authorized to edit this post!'
		end
	end

	def new
		@post = Post.new
		@trip = Trip.find(params[:trip_id])
	end

	def create
		@post = Post.new(post_params)
		@post.trip_id = params[:trip_id]
		@post.user_id = current_user.id
		if @post.save
			redirect_to @post.trip, notice: 'Your post was published!'
		else
			render :new
		end
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to @post.trip, notice: 'Your post was succesfully updated!'
		else
			render :edit
		end
	end

	def destroy
		unless current_user == @post.user
		  redirect_to :back, notice: 'You are not authorized to delete this post!'
		end
		@post.destroy if @post.user == current_user
		redirect_to @post.trip, notice: 'Your post was succesfully deleted!'
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:content, :image)
	end

end