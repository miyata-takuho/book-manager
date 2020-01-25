class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_one :rental_logs
  validates :email, {presence: true}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def rent
    rental_logs.create!(status: :first_day)
  end
end
