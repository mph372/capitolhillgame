class AddUnionGunMembershipToStates < ActiveRecord::Migration[6.1]
  def change
    add_column :states, :gun_owners, :float
    add_column :states, :union_members, :float
  end
end
