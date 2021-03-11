class Politician < ApplicationRecord
  belongs_to :user
  belongs_to :congress
end
