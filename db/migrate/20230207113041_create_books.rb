class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.string :published
      t.string :description

      t.timestamps
    end
    add_index :books, :user_id
  end
end
