class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :congress
  has_one :politician, dependent: :destroy
end
