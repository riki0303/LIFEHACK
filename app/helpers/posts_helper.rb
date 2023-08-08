module PostsHelper
  def my_post?(user, post)
    user == post.user
  end
end
