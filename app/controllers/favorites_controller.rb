class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.favorites.includes(user: { profile: :avatar_attachment }).with_attached_image.order(created_at: 'DESC')
  end
end