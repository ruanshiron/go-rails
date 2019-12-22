class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  after_create_commit { notify }

  private
  def notify
    Notification.create(event: "#{self.follower.name} has followed #{self.followed.name}")
  end
end