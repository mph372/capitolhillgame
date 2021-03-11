class CongressesController < InheritedResources::Base

  private

    def congress_params
      params.require(:congress).permit(:size, :number_of_states, :include_senate, :include_campaigns, :include_money, :include_committees, :is_private, :includes_leadership, :country_direction, :weeks_per_session, :length_of_week, :bill_limit, :contribution_limit, :interest_groups)
    end

end
