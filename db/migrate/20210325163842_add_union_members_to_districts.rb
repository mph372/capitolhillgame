class AddUnionMembersToDistricts < ActiveRecord::Migration[6.1]
  def change
    add_column :districts, :union_membership, :float
  end
end
