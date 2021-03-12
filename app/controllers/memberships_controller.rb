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

    def destroy
        @membership = current_user.membership.find(params[:id])

        if @membership.destroy
            redirect_to user_path(current_user)
        end
    end 

end
