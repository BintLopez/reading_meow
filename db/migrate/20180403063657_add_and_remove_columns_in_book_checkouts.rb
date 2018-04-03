class AddAndRemoveColumnsInBookCheckouts < ActiveRecord::Migration[5.1]
  def change
    add_column :book_checkouts, :action, :string
    add_column :book_checkouts, :condition, :string
    add_column :book_checkouts, :eff_date, :date

    remove_column :book_checkouts, :checked_out_date
    remove_column :book_checkouts, :returned_date
  end
end
