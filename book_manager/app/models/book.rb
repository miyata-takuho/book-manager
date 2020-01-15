class Book < ApplicationRecord
  ratyrate_rateable "review"
  belongs_to :user, optional: true
      # attr_accessor :title, :description
   validates :title, {presence: true}

end
