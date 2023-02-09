class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :password_digest
      t.text :bio
      t.string :address
      t.integer :phoneNumber
      # t.string :profile_pic

      t.timestamps
    end
  end
end
