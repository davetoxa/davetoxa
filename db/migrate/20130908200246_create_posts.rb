class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :state, default: 'published', null: false
      t.belongs_to :user, index: true
      t.foreign_key :users
      t.timestamps
    end
  end
end
