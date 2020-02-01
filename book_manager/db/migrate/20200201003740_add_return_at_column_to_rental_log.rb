class AddReturnAtColumnToRentalLog < ActiveRecord::Migration[5.1]
  def change
    add_column :rental_logs, :returned_at, :DateTime
  end
end
