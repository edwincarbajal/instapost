class Comment < ApplicationRecord
  validates :content, length: { minimum: 3,
                                maximum: 300 }

  belongs_to :user
  belongs_to :post
end
