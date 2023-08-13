class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(user_id: current_user.id)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))

    if @comment.save
      redirect_to post_path(@post), notice: 'コメント出来ました'
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!

    post = Post.find(params[:post_id])
    redirect_to post_path(post), notice: '削除出来ました'
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end