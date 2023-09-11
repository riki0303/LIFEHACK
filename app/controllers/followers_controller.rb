class FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])
    @followers = @user.follower.all.includes(profile: :avatar_attachment).page(params[:page]).order(created_at: 'DESC')
  end
end
