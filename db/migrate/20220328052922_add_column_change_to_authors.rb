class AddColumnChangeToAuthors < ActiveRecord::Migration[7.0]
  def change
    change_column_null :authors, :name, false
  end
end
