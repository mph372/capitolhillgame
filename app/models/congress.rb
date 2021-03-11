class Congress < ApplicationRecord
    has_many :user_congresses
    has_many :users, through: :user_congresses
end
