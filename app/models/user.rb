class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :buildings, foreign_key: :user_id, dependent: :destroy
  #has_many :parts ,through: :buildings
  #has_many :parts 
end
