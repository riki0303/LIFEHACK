class AccountsController <ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @posts = @user.posts.all.with_attached_image.page(params[:page]).per(30)

    if @user == current_user
      redirect_to profile_path
    end
  end
end
