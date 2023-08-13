module CommentsHelper
  def my_comment?(comment)
    comment.user == current_user
  end
end