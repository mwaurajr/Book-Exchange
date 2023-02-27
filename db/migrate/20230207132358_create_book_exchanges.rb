class CreateBookExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :book_exchanges do |t|
      t.belongs_to :sender, foreign_key: { to_table: :users }
      t.belongs_to :receiver, foreign_key: { to_table: :users }
      t.belongs_to :book, foreign_key: true

      t.timestamps
    end
  end
end
