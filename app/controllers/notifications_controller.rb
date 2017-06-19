class NotificationsController < ApplicationController
  before_action :get_notifications, only: [:index]

  def index
  end

  def link_through
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    redirect_to post_path(@notification.post)
  end

  def follow_link_through
    @notification = Notification.find(params[:id])
    notified_by = User.find(@notification.notified_by_id)
    @notification.update(read: true)
    redirect_to profile_path(notified_by.user_name)
  end

  private

    def get_notifications
      @notifications = current_user.notifications.order('created_at DESC')
    end
end
