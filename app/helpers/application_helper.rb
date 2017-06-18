module ApplicationHelper
  # Returns the full title on a per-page basis
  def full_title(page_title = '')
    base_title = 'Instapost'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def alert_for(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def form_image_select(post)
    return image_tag post.image.url(:medium),
                      id:'image-preview',
                      class:'img-fluid' if post.image.exists?
    image_tag '', id:'image-preview',
                                 class:'img-fluid'
  end

  def post_user_avatar_select(user)
    return image_tag user.avatar.url(:medium),
                      id:'post_user_avatar',
                      class:'img-fluid rounded-circle post_profile_image post_profile_preview' if user.avatar.exists?
    image_tag 'default-avatar.jpg', id:'post_user_avatar',
                                    class:'img-fluid post_profile_image post_profile_preview'
  end

  def profile_avatar_select(user)
    return image_tag user.avatar.url(:medium),
                      id:'user_avatar',
                      class:'img-fluid rounded-circle profile-image profile-preview' if user.avatar.exists?
    image_tag 'default-avatar.jpg', id:'user_avatar',
                                    class:'img-fluid rounded-circle profile-image profile-preview'
  end

  def pagination_count?
    Post.all.count > 8
  end

  def current_user_is_following(current_user, following_id)
    Follow.where(follower: current_user, following: following_id).empty?
    # current_user.follower_relationships.where(following: following_id).empty?
  end
end
