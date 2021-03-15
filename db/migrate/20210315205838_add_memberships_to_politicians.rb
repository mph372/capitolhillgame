class AddMembershipsToPoliticians < ActiveRecord::Migration[6.1]
  def change
    add_reference :politicians, :membership, foreign_key: true
  end
end
