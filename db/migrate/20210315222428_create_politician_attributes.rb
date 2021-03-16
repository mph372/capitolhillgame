class CreatePoliticianAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :politician_attributes do |t|
      t.integer :name_id
      t.integer :district_connection
      t.integer :base_support
      t.integer :moderate_support
      t.integer :opposition_support
      t.integer :opposition_intensity
      t.integer :district_name_id
      t.integer :statewide_name_id
      t.integer :national_name_id
      t.integer :party_loyalty
      t.integer :power_score
      t.integer :credibility_score
      t.references :politician, null: false, foreign_key: true

      t.timestamps
    end
  end
end
