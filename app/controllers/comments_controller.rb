class CommentsController < ApplicationController
  
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

		def index
			# if params[:sort]
			# 	@comments = Comment.order(params[:sort])
			# else
			# 	@comments = Comment.all
			# end
		end

		def show
		end

		def edit
		end

		def new
			@comment = Comment.new
		end

		def create
			p "*" * 50
			p params
			p current_user
			@comment = Comment.new(comment_params)
			if @comment.save
				redirect_to :back, notice: 'Your comment was published!'
			else
				render :new
			end
		end

		def update
			if @comment.update_attributes(comment_params)
				redirect_to posts_path, notice: 'Your comment was succesfully updated!'
			else
				render :edit
			end
		end

		def destroy
			@comment.destroy
			redirect_to posts_path, notice: 'Your comment was succesfully deleted!'
		end

		private

		def set_comment
			@comment = Comment.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:handle, :content, :user_id, :post_id)
		end

end
