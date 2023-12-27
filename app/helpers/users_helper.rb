module UsersHelper
  def guest_user?(user)
    user.email == 'guest@example.com'
  end
end
