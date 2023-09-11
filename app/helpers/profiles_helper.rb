module ProfilesHelper
  def display_profile_avatar(profile,css_class)
    if profile&.avatar.present?
      image_tag profile.avatar, class: css_class
    else
      image_tag 'noavatar.png', class: css_class
    end
  end
end
