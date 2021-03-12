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

  def join
    @congress = Congress.find(params[:id])
    @m = @congress.memberships.build(:user_id => current_user.id)
    respond_to do |format|
      if @m.save
        format.html { redirect_to(@congress, :notice => 'You have joined this Congress.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(@congress, :notice => 'Join error.') }
        format.xml  { render :xml => @congress.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

    def congress_params
      params.require(:congress).permit(:size, :number_of_states, :include_senate, :include_campaigns, :include_money, :include_committees, :is_private, :includes_leadership, :country_direction, :weeks_per_session, :length_of_week, :bill_limit, :contribution_limit, :interest_groups)
    end

end
