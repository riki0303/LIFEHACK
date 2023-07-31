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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: '更新出来ました'
    else
      flash.now[:error] = '更新出来ませんでした'
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end