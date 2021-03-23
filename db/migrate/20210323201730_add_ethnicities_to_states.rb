class AddEthnicitiesToStates < ActiveRecord::Migration[6.1]
  def change
    add_column :states, :white_population, :float
    add_column :states, :latino_population, :float
    add_column :states, :black_population, :float
    add_column :states, :asian_population, :float
    add_column :states, :other_population, :float
  end
end
