class District < ApplicationRecord
  belongs_to :state, optional: true
  belongs_to :congress
  belongs_to :politician, optional: true
end
