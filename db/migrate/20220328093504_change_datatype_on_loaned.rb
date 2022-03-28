class ChangeDatatypeOnLoaned < ActiveRecord::Migration[7.0]
  def change
    change_column :loaned_books, :loaned_date, :timestamp, null: false
    change_column :loaned_books, :returned_date, :timestamp, null: false
    change_column :loaned_books, :due_date, :timestamp, null: false
  end
end
