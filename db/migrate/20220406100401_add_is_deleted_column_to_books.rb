class AddIsDeletedColumnToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :is_deleted, :boolean, default: false
  end
end
