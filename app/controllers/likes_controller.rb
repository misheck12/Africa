class LikesController < ApplicationController
  def new
    @current_user = ApplicationController.new.current_user
    @post = Post.find(params[:post_id])
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id, post_id: @post)
    if @like.save
      redirect_to user_post_path(@post.author_id, @post.id)
    else
      render :new, notice: 'Error Occured While Liking The Post'
    end
  end
end
