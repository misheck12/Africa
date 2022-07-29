class UsersController < ApplicationController
  def index
    redirect_to new_user_session_path if current_user.nil?
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.last_three_posts
  end
end
