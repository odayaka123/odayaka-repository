class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, :body, presence: true
end
