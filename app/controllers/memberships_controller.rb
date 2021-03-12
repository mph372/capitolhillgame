class MembershipsController < ApplicationController
    def create
        @congress = Congress.find(params[:cliq_id])
        
        @membership = current_user.memberships.build(congress: @congress)

        if @membership.save
        flash[:notice] = "Joined #{@congress.name}"
        else
        #Set up multiple error message handler for rejections/already a member
        flash[:notice] = "Not able to join Congress."
            redirect_to congress_url
        end
    end

    def destroy
       
        @membership = current_user.memberships.find(params[:id])
        @membership.destroy
    
        if @membership.destroy
           flash[:notice] = "You left the Congress."
        redirect_to congresses_path
        else
        end
    end

end
