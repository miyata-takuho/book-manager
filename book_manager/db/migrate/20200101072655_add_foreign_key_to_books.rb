class AddForeignKeyToBooks < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :user_id, :bigint
    add_foreign_key :books, :users
  end
end
