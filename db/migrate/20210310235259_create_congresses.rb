class CreateCongresses < ActiveRecord::Migration[6.1]
  def change
    create_table :congresses do |t|
      t.integer :size
      t.integer :number_of_states
      t.boolean :include_senate
      t.boolean :include_campaigns
      t.boolean :include_money
      t.boolean :include_committees
      t.boolean :is_private
      t.boolean :includes_leadership
      t.integer :country_direction
      t.boolean :weeks_per_session
      t.string :length_of_week
      t.integer :bill_limit
      t.integer :contribution_limit
      t.boolean :interest_groups

      t.timestamps
    end
  end
end
