class NotificationsController < ApplicationController
  before_action :get_notifications, only: [:index]

  def index
  end

  def link_through
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    redirect_to post_path(@notification.post)
  end

  private

    def get_notifications
      @notifications = current_user.notifications
    end
end
