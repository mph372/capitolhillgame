class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.string :name
      t.integer :population
      t.string :region
      t.integer :military_population
      t.integer :median_age
      t.integer :median_income
      t.integer :government_workers
      t.integer :pvi
      t.references :congress, null: false, foreign_key: true

      t.timestamps
    end
  end
end
