class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.includes(user: { profile: :avatar_attachment }).with_attached_image.page(params[:page]).order(created_at: 'DESC')
    @q = Post.ransack(params[:q])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(id: 'DESC')
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿出来ました'
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: '更新出来ました'
    else
      flash.now[:error] = '更新出来ませんでした'
      render :edit
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_path, notice: '削除出来ました'
  end

  def search
    @q = Post.ransack(params[:q])
    if params[:q].present?
      @posts = @q.result(distinct: true).includes(user: { profile: :avatar_attachment }).with_attached_image.page(params[:page]).order(created_at: 'DESC')
    else
      @posts = Post.none # 空の結果を設定
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
