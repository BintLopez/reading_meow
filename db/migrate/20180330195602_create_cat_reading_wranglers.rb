class CreateCatReadingWranglers < ActiveRecord::Migration[5.1]
  def change
    create_table :cat_reading_wranglers do |t|
      t.string :library_card_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
