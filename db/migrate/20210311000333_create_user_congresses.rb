class CreateUserCongresses < ActiveRecord::Migration[6.1]
  def change
    create_table :user_congresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :congress, null: false, foreign_key: true

      t.timestamps
    end
  end
end
