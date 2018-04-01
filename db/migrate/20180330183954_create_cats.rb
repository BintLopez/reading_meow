class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :breed
      t.text :bio
      t.references :user, foreign_key: true, index: true
      t.boolean :profile_public

      t.timestamps
    end
  end
end
