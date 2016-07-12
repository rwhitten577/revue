class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  def destroy
    user = User.find(params[:id])
    review = Review.find_by(params[:user_id])
    venue = Venue.find_by(params[:user_id])
    review.destroy if !review.nil?
    venue.destroy if !venue.nil?
    user.destroy
    redirect_to admin_users_path
  end
end
