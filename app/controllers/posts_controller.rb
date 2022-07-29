class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
    @user = User.find(params[:user_id])
<<<<<<< HEAD
    @post = Post.where(author_id: @user.id).order(created_at: :desc)
=======
    @posts = @user.posts.includes(:comments, :author)
>>>>>>> 9fcc4eacc1865e4fd24c87cda75c6a5f5125329f
  end

  def show
    @user = User.find(params[:user_id])
<<<<<<< HEAD
    @post = Post.includes(:author, :comments).find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @current_user = User.find(params[:user_id])
    @post = @current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to @current_user
    else
      render :new, alert: 'An error has occurred while creating the post'
=======
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = current_user.posts.new(author_id: params[:user_id], comments_counter: 0, likes_counter: 0)
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
>>>>>>> 9fcc4eacc1865e4fd24c87cda75c6a5f5125329f
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @post.destroy!
    redirect_to user_posts_path(@user.id), notice: 'Post deleted successfully!'
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :title, :text, :comments_counter, :likes_counter)
  end
end
