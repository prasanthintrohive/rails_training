class CreateLoanedBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :loaned_books do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :book, foreign_key: true
      t.timestamp :loaned_date
      t.timestamp :returned_date
      t.string :status
      t.timestamps
    end
  end
end