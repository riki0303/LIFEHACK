module LikesHelper
  def display_likes_count(post)
    post.likes.count
  end
end
