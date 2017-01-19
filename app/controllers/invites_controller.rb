class InvitesController < ApplicationController

def index
end

def new
	@trip = Trip.find(params[:trip_id])
	@invite = Invite.new
	a = Invite.where(trip: @trip).pluck(:user_id)
	@users = User.where("id NOT IN (?)", a) if @trip.invited_users.count > 0
	@users = User.all if @trip.invited_users.count == 0
	@users = @users.to_a
	@users.delete_if {|u| u[:id] == @trip.user_id}
end

def create
	@invite = Invite.new(params.require(:invite).permit(:user_id))
	@invite.trip_id = params[:trip_id]
	if @invite.save #invite save or trip save?
		redirect_to trip_path(params[:trip_id]), notice: "The crew member was successfully added!"
	else
		render :new
	end
end

end