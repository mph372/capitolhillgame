class ChangeDensityToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :districts, :pop_per_sq_mile, :float
  end
end
