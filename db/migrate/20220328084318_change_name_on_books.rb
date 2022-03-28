class ChangeNameOnBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :endpublised_year, :published_year
  end
end
