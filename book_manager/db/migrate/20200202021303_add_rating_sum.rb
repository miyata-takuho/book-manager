class AddRatingSum < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :rating_sum, :integer
  end
end
