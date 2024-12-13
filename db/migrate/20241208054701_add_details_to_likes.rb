class AddDetailsToLikes < ActiveRecord::Migration[8.0]
  def change
    add_reference :likes, :likable, polymorphic: true, null: false
  end
end
