class CreatePoliticians < ActiveRecord::Migration[6.1]
  def change
    create_table :politicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :party
      t.string :profession
      t.string :avatar
      t.boolean :is_currently_candidate
      t.string :is_incumbent
      t.integer :current_coh
      t.integer :charisma
      t.integer :intelligence
      t.integer :work_ethic
      t.integer :moral_compass
      t.integer :network
      t.references :user, null: false, foreign_key: true
      t.references :congress, null: false, foreign_key: true

      t.timestamps
    end
  end
end
