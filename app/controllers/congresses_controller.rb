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
        @states.each do |state|
          state.congress = @congress
          state.generate_name
        end

        @districts.each do |district|
          district.congress = @congress
          district.generate_pvi
          district.generate_density
          district.generate_population
          district.generate_ethnicities
        end

        @congress.reload

        @congress.assign_district_counts
        @congress.assign_districts
        @congress.assign_district_numbers
        
        @districts.each do |district|
         
          
          district.generate_military_base
          district.generate_geography_type
          district.generate_gun_owners
          district.generate_union_membership
          district.generate_income
          district.generate_seniors
          
        end

        @congress.reload

        @congress.calculate_state_pvi
        @congress.calculate_state_population
        @congress.calculate_state_density
        @congress.calculate_state_ethnicities
        @congress.generate_state_region

        @congress.calculate_state_union_membership
        @congress.calculate_state_gun_owners
        @congress.generate_district_regions
        @congress.generate_district_industry

        


       
      
      if @congress.save
        redirect_to congresses_path
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
