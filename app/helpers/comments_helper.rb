module CommentsHelper
  def my_comment?(comment)
    comment.user == current_user
  end

  def comments_count(post)
    post.comments.count
  end
end