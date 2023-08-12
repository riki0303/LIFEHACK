class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
    @comment.user_id = current_user.id
  end

  def create

  end

  def destroy

  end

  private
  def post_params
    params.require(:comments).permit(:content)
  end
end