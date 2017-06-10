class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: 'User'
  belongs_to :user
  belongs_to :post

  validates :user_id, :notified_by_id, :post_id, :indentifier, :notice_type, presence: true 
end
