class Politician < ApplicationRecord
  belongs_to :user
  belongs_to :congress
  belongs_to :membership
  has_one :politician_attribute
  has_one :district
end
