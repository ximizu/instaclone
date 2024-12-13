class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likable, dependent: :destroy

  def like!(user)
    likes << Like.new(user: user)
  end
end
