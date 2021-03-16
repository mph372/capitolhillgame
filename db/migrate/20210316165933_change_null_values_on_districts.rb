class ChangeNullValuesOnDistricts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :districts, :state_id, true
    change_column_null :districts, :politician_id, true
  end
end
