class User < ApplicationRecord

  validates :email, presence: true
  validates :password, presence: true
  validates_length_of :password, minimum: 6
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
