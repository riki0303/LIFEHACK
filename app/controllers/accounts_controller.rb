class AccountsController <ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @posts = @user.posts.all

    if @user == current_user
      redirect_to profile_path
    end
  end
end