class CreateBookExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :book_exchanges do |t|
      t.references :sender, foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users }
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
