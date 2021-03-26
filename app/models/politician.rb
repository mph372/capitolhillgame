class Politician < ApplicationRecord
  belongs_to :user
  belongs_to :congress
  belongs_to :membership
  has_one :politician_attribute, dependent: :destroy
  has_one :district

  validate :attribute_total
    

  def attribute_total
      @attribute_total = (charisma + intelligence + work_ethic + moral_compass + network)
      errors[:base] << "Total attribute score cannot be above 250!" unless @attribute_total <= 250
  end

end
