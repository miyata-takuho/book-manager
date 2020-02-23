class AddCommentAndRatingToRentalLog < ActiveRecord::Migration[5.1]
  def change
    add_column :rental_logs, :comment, :text
    add_column :rental_logs, :rating, :integer
  end
end
