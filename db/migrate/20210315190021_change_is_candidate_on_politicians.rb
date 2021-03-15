class ChangeIsCandidateOnPoliticians < ActiveRecord::Migration[6.1]
  def change
    change_column :politicians, :is_incumbent, 'boolean USING CAST(is_incumbent AS boolean)'
    change_column :congresses, :weeks_per_session, 'integer USING CAST(weeks_per_session AS integer)'
  end
end
