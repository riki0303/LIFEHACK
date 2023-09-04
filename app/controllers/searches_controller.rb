class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = User.ransack(params[:q])
    if params[:q].present?
      @users = @q.result(distinct: true)
    else
      @users = User.none # 空の結果を設定
    end
  end
end