class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy

  def like!(user)
    likes << Like.new(user: user)
  end

  def unlike!(user)
    likes.where(user_id: user.id).delete_all
  end
end
