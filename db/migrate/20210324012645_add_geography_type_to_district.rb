class AddGeographyTypeToDistrict < ActiveRecord::Migration[6.1]
  def change
    add_column :districts, :geography_type, :string
  end
end
