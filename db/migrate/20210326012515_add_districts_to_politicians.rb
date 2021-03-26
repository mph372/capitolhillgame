class AddDistrictsToPoliticians < ActiveRecord::Migration[6.1]
  def change
    add_reference :politicians, :district, foreign_key: true
  end
end
