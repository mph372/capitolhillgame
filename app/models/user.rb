class User < ApplicationRecord
  has_many :memberships
  has_many :congresses, through: :memberships
  has_many :owned_congresses, foreign_key: "owner_id", class_name: "Congress"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

end
