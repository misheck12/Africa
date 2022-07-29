class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def show; end

  def new
    @like = Like.new
  end

  def create
    @like = current_user.likes.new
    @like.post_id = params[:post_id]
    if @like.save
      redirect_to user_post_path(current_user.id, params[:post_id])
    else
      render :create
    end
  end
end
