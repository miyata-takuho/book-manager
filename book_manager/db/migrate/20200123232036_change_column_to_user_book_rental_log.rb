class ChangeColumnToUserBookRentalLog < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :status, :integer, :default => 0
    change_column :books, :status, :integer, :default => 0
    change_column :rental_logs, :status, :integer, :default => 0
  end
end
