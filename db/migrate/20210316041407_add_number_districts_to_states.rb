class AddNumberDistrictsToStates < ActiveRecord::Migration[6.1]
  def change
    add_column :states, :number_of_districts, :integer
  end
end
