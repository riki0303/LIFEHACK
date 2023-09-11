class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])
    @followings = @user.followings.all.includes(profile: :avatar_attachment).page(params[:page]).order(created_at: 'DESC')
  end
end
