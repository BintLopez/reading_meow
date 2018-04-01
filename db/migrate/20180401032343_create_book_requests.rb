class CreateBookRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :book_requests do |t|
      t.string :status
      t.timestamp :accepted_at
      t.date :delivery_date
      t.timestamp :delivered_at
      t.timestamp :picked_up_at
      t.jsonb :request_data
      t.references :cat, foreign_key: true, index: true
      t.references :cat_reading_wrangler, foreign_key: true, index: true

      t.timestamps
    end
  end
end
