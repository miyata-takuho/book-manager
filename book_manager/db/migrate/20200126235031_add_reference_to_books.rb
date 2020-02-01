class AddReferenceToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :rental_logs, foreign_key: true
  end
end
