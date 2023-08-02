class HomesController < ApplicationController
  def show
    if user_signed_in?
      redirect_to posts_path
    end
  end
end
