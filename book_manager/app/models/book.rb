class Book < ApplicationRecord
  belongs_to :user, optional: true
      # attr_accessor :title, :description
   validates :title, {presence: true}

   def blank_stars
     5 - rating.to_i
   end

end
