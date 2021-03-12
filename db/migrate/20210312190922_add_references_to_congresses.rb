class AddReferencesToCongresses < ActiveRecord::Migration[6.1]
  def change
  end
  add_index :congresses, :owner_id
  add_foreign_key :congresses, :users, column: :owner_id
end
