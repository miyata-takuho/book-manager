class ChangeDataTypeOfBorrowedBy < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :borrowed_by, :integer
  end
end
