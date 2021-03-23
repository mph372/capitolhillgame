class CongressesController < InheritedResources::Base

  def index
    @congresses = Congress.all
  end
  
  def show
    @congress = Congress.find(params[:id])
  end

  def new
    @congress = Congress.new(params[:id])
  end

  def create
    @congress = current_user.owned_congresses.build(congress_params)
    @congress.members << current_user

    @states = []
    num_of_states = @congress.number_of_states
    num_of_states.times do |state|
      @states << State.new
    end

    @districts = []
    num_of_districts = @congress.size
    num_of_districts.times do |district|
      @districts << District.new
    end

    Congress.transaction do
      @congress.save
      if @congress.save
        redirect_to congresses_path
        @states.each do |state|
          state.congress = @congress
          state.save!
        end
        @districts.each do |district|
          district.congress = @congress
          district.generate_pvi
          district.generate_density
          district.pop_density_revise
          district.generate_population
          district.save!
        end
        @states.each do |state|
          state.generate_name
          state.generate_region
        end
        @congress.assign_district_counts
        @congress.assign_districts
        @congress.assign_district_numbers
        @congress.calculate_state_pvi
        @congress.calculate_state_population
      else
        render 'new'
      end
      
    end


    
  end  

  def join
    @congress = Congress.find(params[:id])
    @m = @congress.memberships.build(:user_id => current_user.id)
    respond_to do |format|
      if @m.save
        format.html { redirect_to new_politician_path(:user_id => current_user, :congress_id => @congress.id) }
        format.xml  { head :ok }
      else
        format.html { redirect_to(@congress, :notice => 'Join error.') }
        format.xml  { render :xml => @congress.errors, :status => :unprocessable_entity }
      end
    end
  end

  # def destroy
   # @congress = current_user.owned_congresses.find(params[:id])
    #flash[:alert] = "Are you sure you want to leave this Congress? Your membership and all of its associations will be permanently deleted."
    #@congress.destroy

    #if @congress.destroy
     #  redirect_to congresses_path
      # flash[:notice] = "You left the Congress."
  #  else
  #      redirect_to congresses_path
  #      #set up error handler
  #      flash[:notice] = "Failed to leave the Congress."
  #  end
  # end
  private

    def congress_params
      params.require(:congress).permit(:size, :number_of_states, :include_senate, :include_campaigns, :include_money, :include_committees, :is_private, :includes_leadership, :country_direction, :weeks_per_session, :length_of_week, :bill_limit, :contribution_limit, :interest_groups)
    end

end
