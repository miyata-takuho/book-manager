class AddNewColumnToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :borrowed_by, :integer
  end
end
