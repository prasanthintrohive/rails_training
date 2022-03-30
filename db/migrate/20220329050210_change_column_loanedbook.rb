class ChangeColumnLoanedbook < ActiveRecord::Migration[7.0]
  def change
    change_column_null :loaned_books, :returned_date, null: true
  end
end
