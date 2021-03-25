class AddMilitaryBasesToDistricts < ActiveRecord::Migration[6.1]
  def change
    add_column :districts, :military_base, :boolean
    add_column :districts, :military_base_type, :string
    add_column :districts, :military_base_name, :string
  end
end
