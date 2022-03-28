class AddChangeOnBooks < ActiveRecord::Migration[7.0]
  def change
    change_column_null :books, :title, false
    change_column_null :books, :published_year, false
    change_column_null :books, :author_id, false
  end
end
