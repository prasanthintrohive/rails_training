class ChangeColumnNameLoaned < ActiveRecord::Migration[7.0]
  def change
    change_column :loaned_books, :loaned_date, :date, null: false
    change_column :loaned_books, :returned_date, :date, null: false
  end
end
