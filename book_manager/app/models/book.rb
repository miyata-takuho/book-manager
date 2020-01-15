class Book < ApplicationRecord
  belongs_to :user, optional: true
      # attr_accessor :title, :description
   validates :title, {presence: true}
 
end
