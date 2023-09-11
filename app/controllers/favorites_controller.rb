class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.favorites.includes(user: { profile: :avatar_attachment }).with_attached_image.page(params[:page]).order(created_at: 'DESC')
  end
end
