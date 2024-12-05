class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.like!(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.likes.where(post_id: @post.id, user_id: current_user.id).delete_all
  end
end
