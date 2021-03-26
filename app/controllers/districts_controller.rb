class DistrictsController < InheritedResources::Base

  def join
    @district = District.find(params[:id])
    @politician = current_user.politicians.find_by(congress_id: @district.congress_id)
    @politician.update_attribute(:district, @district)


    respond_to do |format|
      if @district.save
        format.html { redirect_to @district }
        format.xml  { head :ok }
      else
        format.html { redirect_to(@congress, :notice => 'Join error.') }
        format.xml  { render :xml => @congress.errors, :status => :unprocessable_entity }
      end
    end

  end

  private

    def district_params
      params.require(:district).permit(:population, :district_type, :region, :veteran_population, :median_age, :median_income, :government_workers, :pvi, :state_id, :congress_id, :politician_id)
    end

end
