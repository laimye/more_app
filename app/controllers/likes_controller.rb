class InvitesController < ApplicationController
  # before_action :authenticate_user!

respond_to :js

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

  # before_action :set_post


# def index
# end

# def new

# end

# def create
# 	@post.likes.where(user_id: current_user.id).first_or_create

#   respond_to do |format|
#     redirect_to @post
#   end
# end

# def destroy
#   @post.likes.where(user_id: current_user.id).destroy_all

#   respond_to do |format|
#     redirect_to @post
#   end
# end

# private

# def set_post
#   @post = Post.find(params[:post_id])
# end

end