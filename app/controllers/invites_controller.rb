class InvitesController < ApplicationController

def index
end

def new
end

def create
	@invite = Invite.new(invite_params)
	@invite.user = current_user
	@invite.trip = Trip.find(params[:trip_id])
	redirect_to trips_path
end

private

def invite_params
		params.require(:invite)
	end 

end