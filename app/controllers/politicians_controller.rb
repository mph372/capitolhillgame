class PoliticiansController < InheritedResources::Base



  def create
    @politician = Politician.new(politician_params)
    @membership = Membership.all.find_by(congress_id: @politician.congress_id, user_id: @politician.user_id)
    @politician.membership_id = @membership.id
    
    respond_to do |format|
      if @politician.save
        flash[:notice] = 'Politician was successfully created.'
        format.html { redirect_to(@politician) }
        format.xml  { render :xml => @politician, :status => :created, :location => @politician }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @politician.errors, :status => :unprocessable_entity }
      end
    end
  
  end 

  private

    def politician_params
      params.require(:politician).permit(:first_name, :last_name, :party, :profession, :avatar, :is_currently_candidate, :is_incumbent, :current_coh, :charisma, :intelligence, :work_ethic, :moral_compass, :network, :user_id, :congress_id, :user, :congress, :membership_id)
    end

end
