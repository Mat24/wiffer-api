class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname, null: false, unique: true
      t.string :username, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :encrypted_password, null: false

      t.timestamps null: false
    end
  end
end
