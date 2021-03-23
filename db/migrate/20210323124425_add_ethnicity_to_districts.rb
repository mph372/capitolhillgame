class AddEthnicityToDistricts < ActiveRecord::Migration[6.1]
  def change
    add_column :districts, :white_population, :float
    add_column :districts, :latino_population, :float
    add_column :districts, :black_population, :float
    add_column :districts, :asian_population, :float
    add_column :districts, :other_population, :float
  end
end
