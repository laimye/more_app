class CommentsController < ApplicationController
  
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def edit
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		@comment.post_id = params[:post_id]
		if @comment.save
			redirect_to :back, notice: 'Your comment was posted!'
		else
			render :new
		end
	end

	def update
		if @comment.update_attributes(comment_params)
			redirect_to post_path(@comment.post), notice: 'Your comment was succesfully updated!'
		else
			render :edit
		end
	end

	def destroy
		@comment.destroy
		redirect_to :back, notice: 'Your comment was succesfully deleted!'
	end

	private

	def set_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:content, :user_id, :post_id)
	end

end
