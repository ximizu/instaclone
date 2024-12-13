class LikesController < ApplicationController
  def create
    if params.key?("post_id")
      @post = Post.find(params[:post_id])
      @post.like!(current_user)
    end

    if params.key?("comment_id")
      @comment = Comment.find(params[:comment_id])
      @comment.like!(current_user)
      @post = @comment.post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.likes.where(likable_id: @post.id, user_id: current_user.id).delete_all
  end
end
