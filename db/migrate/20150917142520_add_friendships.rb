class AddFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :approved, default: false
      t.boolean :blocked, default: false
    end
  end
end
