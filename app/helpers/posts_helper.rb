module PostsHelper
  def my_post?(user, post)
    user == post.user
  end

  def user_avatar(post)
    user_avatar = post.user.profile&.avatar

    if user_avatar.present?
      image_tag user_avatar, class: 'post__avatar'
    else
      image_tag 'noavatar.png', class: 'post__avatar'
    end
  end
end
