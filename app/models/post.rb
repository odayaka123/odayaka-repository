class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :title, presence: { message: "タイトルを入力してください" }
  validates :body, presence: { message: "本文を入力してください" }
end
