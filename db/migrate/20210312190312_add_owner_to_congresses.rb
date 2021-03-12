class AddOwnerToCongresses < ActiveRecord::Migration[6.1]
  def change
  add_column :congresses, :owner_id, :integer
  end
end
