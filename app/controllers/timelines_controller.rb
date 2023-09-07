class TimelinesController < ApplicationController
  before_action :authenticate_user!
  def show
    user_ids = current_user.followings.pluck(:id)
    @posts = Post.where(user_id: user_ids ).includes(user: { profile: :avatar_attachment }).with_attached_image
  end
end