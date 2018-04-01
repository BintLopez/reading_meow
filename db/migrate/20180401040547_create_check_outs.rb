class CreateCheckOuts < ActiveRecord::Migration[5.1]
  def change
    create_table :check_outs do |t|
      t.references :book_request, foreign_key: true
      t.references :library, foreign_key: true
      t.date :return_due_date
      t.timestamp :returned_at

      t.timestamps
    end
  end
end