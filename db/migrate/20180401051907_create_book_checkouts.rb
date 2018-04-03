class CreateBookCheckouts < ActiveRecord::Migration[5.1]
  def change
    create_table :book_checkouts do |t|
      t.integer :book_id
      t.integer :checkout_id
      t.date :checked_out_date
      t.date :returned_date

      t.timestamps
    end
  end
end
