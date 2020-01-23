class CreateRentalLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_logs do |t|
      t.integer :status
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
