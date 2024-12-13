class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likable, dependent: :destroy

  def like!(user)
    likes << Like.new(user: user)
  end

  def unlike!(user)
    likes.where(user_id: user.id).delete_all
  end
end
