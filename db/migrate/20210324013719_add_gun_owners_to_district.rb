class AddGunOwnersToDistrict < ActiveRecord::Migration[6.1]
  def change
    add_column :districts, :gun_owners, :float
  end
end
