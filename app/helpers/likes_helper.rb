module LikesHelper
  def has_liked?(user, post)
    user.likes.exists?(post_id: post.id)
  end
end