class CreateSubscribe < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.string :email, null: false
      t.boolean :active, default: true
      t.timestamps
    end
    add_index :subscribes, :email
  end
end
