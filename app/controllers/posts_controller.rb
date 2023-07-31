class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿出来ました'
    else
      flash.now[:error] = '投稿出来ませんでした'
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end