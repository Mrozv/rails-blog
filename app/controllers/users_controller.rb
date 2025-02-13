class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]

  def show
    @user_posts = BlogPost.where(user_id: @user.id).includes(:user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
