module LikesHelper
  def has_liked?(user, post)
    user.likes.exists?(post_id: post.id)
  end

  def likes_count(post)
    post.likes.count
  end
end