class CommentsController < ApplicationController
  def new
  end

  def create
    @post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.post = @post
    comment.user = current_user

    if comment.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def like
    if current_user
      @comment = Comment.find(params[:comment_id])
      @comment.like!(current_user)
      render partial: "comments/like", locals: { comment: @comment }
    else
      redirect_to new_user_session_path
    end
  end

  def unlike
    @comment = Comment.find(params[:comment_id])
    @comment.unlike!(current_user)
    render partial: "comments/like", locals: { comment: @comment }
  end

  private
   def comment_params
     params.require(:comment).permit(:body)
   end
end
