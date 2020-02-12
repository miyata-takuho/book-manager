class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :rental_logs, dependent: :destroy
  validates :email, {presence: true}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def rent
    rental_logs.create!(status: :first_day)
  end

  def self.borrowed_user_name(book)
    borrowed_user_id = book.borrowed_by
    borrowed_user = User.find_by(id: borrowed_user_id)
    borrowed_user.name
  end
end
