class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :about
      t.string :fact
      t.text :places
      t.attachment :image
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
