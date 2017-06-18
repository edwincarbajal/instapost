module NotificationsHelper
  def notification_counter(user)
    current_user.notifications.where(read: false).count < 1
  end

  def notification_read(notification)
    return 'unread-notification' unless notification.read
  end
end
