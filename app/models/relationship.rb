class Relationship < ApplicationRecord
  def self.delete_follow_notification(followed_user, current_user)
    Notification.find_by(
                          user_id: followed_user.id,
                          notified_by_id: current_user.id,
                          notice_type: 'follow'
    ).destroy
  end
end
