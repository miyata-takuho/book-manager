class AddStatusToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :status, :integer
  end
end
