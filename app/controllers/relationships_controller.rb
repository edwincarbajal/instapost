class RelationshipsController < ApplicationController
  before_action :set_user

  def follow_user
    if current_user.follow(@user.id)
      create_notification(@user, current_user)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow_user
    if current_user.unfollow(@user.id)
      Relationship.delete_follow_notification(@user, current_user)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

    def create_notification(followed_user, current_user)
      return if followed_user.id == current_user.id
      Notification.create(user_id: followed_user.id,
                          notified_by_id: current_user.id,
                          post_id: 0,
                          identifier: followed_user.followers.count,
                          notice_type: 'follow')
    end

    def set_user
      @user = User.find_by!(user_name: params[:user_name])
    end
end
