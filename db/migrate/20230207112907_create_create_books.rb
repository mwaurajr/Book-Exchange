class CreateCreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :create_books do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.string :description

      t.timestamps
    end
    add_index :create_books, :user_id
  end
end
