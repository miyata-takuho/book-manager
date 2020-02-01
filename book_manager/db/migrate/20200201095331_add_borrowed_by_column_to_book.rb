class AddBorrowedByColumnToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :borrowed_by, :string
  end
end
