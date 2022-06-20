class AddCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :count, :integer, default: 3
  end
end
