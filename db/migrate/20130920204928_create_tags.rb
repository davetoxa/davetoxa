class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title, null: false
      t.timestamps
    end

    create_join_table :posts, :tags do |t|
      t.index :tag_id
      t.index :post_id
      t.index [:tag_id, :post_id], unique: true
    end
  end
end
