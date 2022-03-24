class CreateLoanedBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :loaned_books do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.timestamp :loaned_date, foreign_key:  true
      t.timestamp :returned_date, foreign_key:  true
      t.string :status
      t.timestamps
    end
  end
end