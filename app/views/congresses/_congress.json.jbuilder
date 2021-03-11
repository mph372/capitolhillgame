json.extract! congress, :id, :size, :number_of_states, :include_senate, :include_campaigns, :include_money, :include_committees, :is_private, :includes_leadership, :country_direction, :weeks_per_session, :length_of_week, :bill_limit, :contribution_limit, :interest_groups, :created_at, :updated_at
json.url congress_url(congress, format: :json)
