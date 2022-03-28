class AddChangeToBooks < ActiveRecord::Migration[7.0]
  def change
    change_column_null :loaned_books, :user_id, false
    change_column_null :loaned_books, :book_id, false
    change_column_null :loaned_books, :loaned_date, false
    change_column_null :loaned_books, :returned_date, false
    change_column_null :loaned_books, :status, false
  end
end
