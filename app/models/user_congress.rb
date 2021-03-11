class UserCongress < ApplicationRecord
  belongs_to :user
  belongs_to :congress
end
