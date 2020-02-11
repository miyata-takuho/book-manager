class RemoveForeignKeyFromBook < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :books, :rental_logs
    remove_reference :books, :rental_logs, index: true
  end
end
