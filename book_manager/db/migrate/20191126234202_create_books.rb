class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      # t.integer :id
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
