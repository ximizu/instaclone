class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.valid?
      @post.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def like
    @post = Post.find(params[:post_id])
    @post.like!(current_user)
    render partial: "posts/like", locals: { post: @post }
  end

  def unlike
    @post = Post.find(params[:post_id])
    @post.unlike!(current_user)
    render partial: "posts/like", locals: { post: @post }
  end

  private

    def post_params
      params.require(:post).permit(:body)
    end
end
