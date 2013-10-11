class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email, null: false
      t.string  :username, null: false
      t.string  :name
      t.string  :info
      t.string  :uid, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :uid, unique: true
  end

end
