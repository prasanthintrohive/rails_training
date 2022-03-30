class ChangeColumnLoanedBook < ActiveRecord::Migration[7.0]
  def change
    change_column_null :loaned_books, :status, null: true
  end
end
