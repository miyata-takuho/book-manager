class Book < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :rental_logs, optional: true
      # attr_accessor :title, :description
  validates :title, {presence: true}
  enum status: [ :not_borrowed, :borrowed ]

   def blank_stars
     5 - rating.to_i
   end
end
