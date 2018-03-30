class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.text :bio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
