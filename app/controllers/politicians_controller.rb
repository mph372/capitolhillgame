class PoliticiansController < InheritedResources::Base

  private

    def politician_params
      params.require(:politician).permit(:first_name, :last_name, :party, :profession, :avatar, :is_currently_candidate, :is_incumbent, :current_coh, :charisma, :intelligence, :work_ethic, :moral_compass, :network, :user_id, :congress_id)
    end

end
