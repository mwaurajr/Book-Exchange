class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.belongs_to :conversation, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :read
      t.boolean :delivered

      t.timestamps
    end
  end
end
