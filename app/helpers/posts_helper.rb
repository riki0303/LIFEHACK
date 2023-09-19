module PostsHelper
  def my_post?(user, post)
    user == post.user
  end

  def user_avatar(post)
    user_avatar = post.user.profile&.avatar

    if user_avatar.present?
      image_tag user_avatar.variant(resize_to_fill: [42,42]) , class: 'post__avatar'
    else
      image_tag 'noavatar.png', class: 'post__avatar'
    end
  end
end
