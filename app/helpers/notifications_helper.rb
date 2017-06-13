module NotificationsHelper
  def notification_counter(user)
    current_user.notifications.where(read: false).count < 1
  end
end
