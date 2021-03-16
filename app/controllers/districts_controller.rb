class DistrictsController < InheritedResources::Base

  private

    def district_params
      params.require(:district).permit(:population, :district_type, :region, :veteran_population, :median_age, :median_income, :government_workers, :pvi, :state_id, :congress_id, :politician_id)
    end

end
