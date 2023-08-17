class FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])
    @followers = @user.follower.all
  end
end