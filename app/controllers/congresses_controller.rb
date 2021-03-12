class CongressesController < InheritedResources::Base

  def show
    @congress = Congress.find(params[:id])
  end

  def new
    @congress = Congress.new(params[:id])
  end

  def create
    @congress = current_user.owned_congresses.build(congress_params)
    @congress.members << current_user

    if @congress.save
        redirect_to current_user
    else
        redirect_to new_congress_path
    end
  end  

  private

    def congress_params
      params.require(:congress).permit(:size, :number_of_states, :include_senate, :include_campaigns, :include_money, :include_committees, :is_private, :includes_leadership, :country_direction, :weeks_per_session, :length_of_week, :bill_limit, :contribution_limit, :interest_groups)
    end

end
