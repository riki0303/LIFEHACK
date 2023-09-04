class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Post.ransack(params[:q])
    if params[:q].present?
      @posts = @q.result(distinct: true).order(id: 'DESC')
    else
      @posts = Post.none # 空の結果を設定
    end
  end
end