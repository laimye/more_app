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
			@comment = @post.comments.new
			@comment.post = @post
			@comments = @post.comments
			p "*" * 50
			p @comments.first.errors.messages
		end

		def edit
		end

		def new
			@post = Post.new
		end

		def create
			@post = Post.new(post_params)
			if @post.save
				redirect_to posts_path, notice: 'Your post was published!'
			else
				render :new
			end
		end

		def update
			if @post.update_attributes(post_params)
				redirect_to posts_path, notice: 'Your post was succesfully updated!'
			else
				render :edit
			end
		end

		def destroy
			@post.destroy
			redirect_to posts_path, notice: 'Your post was succesfully deleted!'
		end

		private

		def set_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:handle, :content)
		end

	end