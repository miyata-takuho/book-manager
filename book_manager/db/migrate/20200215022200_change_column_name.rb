class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :borrowed_by, :borrowing_user
  end
end
