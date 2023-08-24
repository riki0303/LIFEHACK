class UnfollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.unfollow!(params[:account_id])

    user = User.find(params[:account_id])
    followers_count = user.follower_relationships.count
    render json: { status: 'ok', followersCount: followers_count }
  end
end