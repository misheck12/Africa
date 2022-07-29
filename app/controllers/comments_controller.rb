class CommentsController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!, only: %i[create destroy]
  load_and_authorize_resource

  def new
    @current_user = current_user
    @post = Post.find(params[:post_id])
=======
  def index
    @comments = Comment.all
  end

  def show; end

  def new
>>>>>>> 9fcc4eacc1865e4fd24c87cda75c6a5f5125329f
    @comment = Comment.new
  end

  def create
<<<<<<< HEAD
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(@post.author_id, @post.id)
    else
      render :new, alert: 'An error has occurred while creating the comment'
=======
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to user_post_path(current_user.id, params[:post_id]), notice: 'Post was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
>>>>>>> 9fcc4eacc1865e4fd24c87cda75c6a5f5125329f
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@user.id, @post.id)
  end

  private

  def comment_params
    params.permit(:text)
  end
end
