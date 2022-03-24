class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :endpublised_year
      t.belongs_to :author, foreign_key:  true
      t.timestamps
    end
  end
end
