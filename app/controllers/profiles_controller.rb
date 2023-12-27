class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @profile = current_user.profile
    @posts = current_user.posts.all.with_attached_image.page(params[:page]).per(30)
  end

  # new,create省略出来るが、profileが存在する場合と存在しない場合を意識して処理を書く必要がある
  def edit
    @profile = current_user.prepare_profile
    @user = current_user
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: '更新出来ました'
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :bio, :avatar)
  end
end
