class AddLibraryToCatReadingWranglers < ActiveRecord::Migration[5.1]
  def change
    add_reference :cat_reading_wranglers, :library, foreign_key: true
  end
end
