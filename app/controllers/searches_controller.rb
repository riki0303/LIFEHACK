class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @q_posts = Post.ransack(params[:q])
    if params[:q].present?
      @posts = @q_posts.result(distinct: true)
    else
      @posts = Post.none # 空の結果を設定
    end
  end
end