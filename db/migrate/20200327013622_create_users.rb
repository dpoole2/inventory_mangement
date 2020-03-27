class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_salt
      t.string :password_hash
      t.boolean :admin
      t.string :email

      t.timestamps
    end
  end
end
