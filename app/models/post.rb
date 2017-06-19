class Post < ApplicationRecord
  acts_as_votable

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :user_id, presence: true
  validates :image, presence: true
  validates :caption, length: { minimum: 3, maximum: 300 }

  has_attached_file :image, styles: { medium: "640x" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :of_followed_users, -> (following_users) { where user_id: following_users }
  scope :of_current_user, -> (current_user) { where user_id: current_user }
  scope :of_current_and_followed_users, -> (following, current) {   self.of_followed_users(following).or(self.of_current_user(current)) }

  def self.delete_like_notification(post, current_user)
    Notification.find_by(
                      user_id: post.user.id,
                      notified_by: current_user.id,
                      post_id: post.id,
                      notice_type: 'like').destroy
  end
end
