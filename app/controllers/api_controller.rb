class ApiController < ApplicationController
  def user_posts
    @user = User.find(params[:user_id])
    @posts = @user.posts.all
    render json: @posts, status: :ok
  end

  def user_post_comments
    @comments = Comment.all
    render json: @comments, status: :ok
  end

  def new_comment
    post = Post.find(params[:post_id])
    @comment = post.comments.new(author: current_user, text: params[:text])
    if @comment.save
      render json: @comment, status: :ok
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end
end