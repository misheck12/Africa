class LikesController < ApplicationController
<<<<<<< HEAD
  def new
    @current_user = ApplicationController.new.current_user
    @post = Post.find(params[:post_id])
=======
  def index
    @likes = Like.all
  end

  def show; end

  def new
>>>>>>> 9fcc4eacc1865e4fd24c87cda75c6a5f5125329f
    @like = Like.new
  end

  def create
<<<<<<< HEAD
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id, post_id: @post)
    if @like.save
      redirect_to user_post_path(@post.author_id, @post.id)
    else
      render :new, notice: 'Error Occured While Liking The Post'
=======
    @like = current_user.likes.new
    @like.post_id = params[:post_id]
    if @like.save
      redirect_to user_post_path(current_user.id, params[:post_id])
    else
      render :create
>>>>>>> 9fcc4eacc1865e4fd24c87cda75c6a5f5125329f
    end
  end
end
