class User < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, {presence: true}
  validates :email, {presence: true}
  validates :password, {presence: true}
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  def intialize
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.name || self.email
  end
end
