class AddReviewTo < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :review, :float
  end
end
