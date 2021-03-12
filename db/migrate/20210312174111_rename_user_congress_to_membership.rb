class RenameUserCongressToMembership < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_congresses, :memberships
  end
end
