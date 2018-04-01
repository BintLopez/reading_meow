class CreateCheckouts < ActiveRecord::Migration[5.1]
  def change
    create_table :checkouts do |t|
      t.references :book_request, foreign_key: true
      t.references :library, foreign_key: true
      t.date :return_due_date
      t.timestamp :returned_at

      t.timestamps
    end
  end
end