class CreateDistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :districts do |t|
      t.integer :population
      t.integer :district_number
      t.string :district_type
      t.string :region
      t.integer :pop_per_sq_mile
      t.float :military_veteran_population
      t.integer :median_age
      t.float :percent_age_above_65
      t.float :percent_age_below_18
      t.float :percent_hs_grad
      t.float :percent_college_grad
      t.float :percent_graduate_grad
      t.integer :median_income
      t.float :poverty_rate
      t.float :sales_and_service
      t.float :government_workers_percent
      t.float :blue_collar_percent
      t.float :white_collar_percent
      t.integer :pvi
      t.string :top_industry_1
      t.string :top_industry_2
      t.string :top_industry_3
      t.references :state, null: false, foreign_key: true
      t.references :congress, null: false, foreign_key: true
      t.references :politician, null: false, foreign_key: true

      t.timestamps
    end
  end
end
