class AddAvailableToCatReadingWrangler < ActiveRecord::Migration[5.1]
  def change
  	add_column :cat_reading_wranglers, :available, :boolean
  end
end
