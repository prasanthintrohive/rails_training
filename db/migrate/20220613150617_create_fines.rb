class CreateFines < ActiveRecord::Migration[7.0]
  def change
    create_table :fines do |t|
      t.belongs_to :loaned_books, foreign_key: true
      t.integer :day_count
      t.integer :amount
      t.string :status
      t.timestamps
    end
  end
end
