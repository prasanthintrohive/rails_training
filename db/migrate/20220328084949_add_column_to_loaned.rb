class AddColumnToLoaned < ActiveRecord::Migration[7.0]
  def change
    add_column :loaned_books, :due_date, :date, null: false
  end
end
