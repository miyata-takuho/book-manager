class User < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :email, {presence: true}
  # attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # def login=(login)
  #   @login = login
  # end
  #
  # def login
  #   @login || self.name || self.email
  # end
end
