module LikesHelper
  def likes_count(post)
    post.likes.count
  end
end