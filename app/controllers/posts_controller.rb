class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = current_user.posts.build
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end