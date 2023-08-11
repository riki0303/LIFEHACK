module ProfilesHelper
  def display_profile_avatar(profile)
    if profile&.avatar.attached?
      image_tag profile.avatar
    else
      image_tag 'noavatar.png'
    end
  end
end