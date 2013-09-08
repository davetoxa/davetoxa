class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :state, default: 'published', null: false
      t.belongs_to :user
      t.timestamps
    end
    add_index :posts, :title
    add_index :posts, :user_id, unique: true
  end
end
