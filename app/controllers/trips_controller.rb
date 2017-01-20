class TripsController < ApplicationController
  
  before_action :authorize, except: [:all]
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    trips = current_user.trips
    invited = current_user.invited_trips
    trips = trips.to_a + invited.to_a
    trips = trips.map { |t| t.id }
    trips = trips.uniq
    @trips = Trip.where("id IN (?)", trips)
  end

  def show
    @invited_users = @trip.invited_users.all
  end

  def new
  	@trip = Trip.new
  end

  def create
  	@trip = Trip.new(trip_params)
    @trip.user = current_user
  	if @trip.save
  		redirect_to trips_path
  	else
  		render :new
  	end
  end

  def edit
    unless current_user == @trip.user
      redirect_to root_path, notice: 'You are not authorized to edit this trip!'
    end
  end

  def update
  	if @trip.update_attributes(trip_params)
  		redirect_to trips_path
		else
			render :edit
		end
	end

	def destroy
    unless current_user == @trip.user
      redirect_to :back, notice: 'You are not authorized to delete this trip!'
    end
		@trip.destroy if @trip.user == current_user
		redirect_to root_path, notice: 'Your trip was succesfully deleted!'
	end

  def all
  	@trips = Trip.all
  end

  private

	def set_trip
		@trip = Trip.find(params[:id])
	end

	def trip_params
		params.require(:trip).permit(:place, :startdate, :enddate, :about, :image)
	end

end
