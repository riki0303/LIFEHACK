class FollowsController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find(params[:account_id])
    follow_status = current_user.has_followed?(user)
    followers_count = user.follower_relationships.count
    render json: { hasFollowed: follow_status, followersCount: followers_count }
  end

  def create
    current_user.follow!(params[:account_id])
    redirect_to account_path(params[:account_id])
  end
end