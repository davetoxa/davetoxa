class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.foreign_key :users
      t.belongs_to :post
      t.foreign_key :posts
      t.string :body, null: false
      t.timestamps
    end
  end
end
