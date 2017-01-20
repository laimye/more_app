class InvitesController < ApplicationController
  # before_action :authenticate_user!

	def like
	  @user = current_user
	  @post = Post.find(params[:post_id])
	  @user.like!(@post)
	end

	def unheart
	  @user = current_user
	  @like = @user.likes.find_by_post_id(params[:post_id])
	  @post = Post.find(params[:post_id])
	  @like.destroy!
	end


end