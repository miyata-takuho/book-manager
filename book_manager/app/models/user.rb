class User < ApplicationRecord
  has_many :books, dependent: :destroy
  belongs_to :rental_logs
  validates :email, {presence: true}
  validates :password, {presence: true}
  # attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def intialize
  end

  def rent
    rental_logs.create!(status: :first_day)

  end

  # def login=(login)
  #   @login = login
  # end
  #
  # def login
  #   @login || self.name || self.email
  # end
end
