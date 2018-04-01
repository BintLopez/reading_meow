class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.references :library, foreign_key: true
      t.string :status
      t.string :condition

      t.timestamps
    end
  end
end
