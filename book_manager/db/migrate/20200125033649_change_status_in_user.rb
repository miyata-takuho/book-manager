class ChangeStatusInUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :status, :integer, :default => false
  end
end
