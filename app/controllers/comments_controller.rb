class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
    @comment.user_id = current_user.id
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(@post), notice: 'コメント出来ました'
    else
      render :new
    end
  end

  def destroy

  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end