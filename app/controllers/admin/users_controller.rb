class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.reviews.destroy unless user.reviews.nil?
    user.venues.destroy unless user.venues.nil?
    user.destroy
    redirect_to admin_users_path
  end
end
