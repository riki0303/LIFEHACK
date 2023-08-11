module ProfilesHelper
  def display_profile_avatar(profile)
    if profile&.avatar.attached?
      image_tag profile.avatar, class: 'profile__avatar'
    else
      image_tag 'noavatar.png', class: 'profile__avatar'
    end
  end
end