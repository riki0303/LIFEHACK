module PostsHelper
  def display_post_image(post)
    if post.image.attached?
      image_tag post.image
    else
      image_tag 'noimage.png'
    end
  end
end