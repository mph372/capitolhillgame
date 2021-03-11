class User < ApplicationRecord
  has_many :user_congresses
  has_many :congresses, through: :user_congresses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

end
