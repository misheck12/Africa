class CommentsController < ApplicationController
  def new
    @current_user = ApplicationController.new.current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(@post.author_id, @post.id)
    else
      render :new, alert: 'An error has occurred while creating the comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
