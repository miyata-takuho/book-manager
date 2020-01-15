class AddUsernameToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :username, :string
  end
end
