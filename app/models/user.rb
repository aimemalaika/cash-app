class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :Name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, length: { minimum: 2, maximum: 255 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, maximum: 55 }
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum: 55 }
end
