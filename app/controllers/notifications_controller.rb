class NotificationsController < ApplicationController
  def index
    @notifications = Notification.last(5).reverse
  end
end
