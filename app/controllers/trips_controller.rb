class TripsController < ApplicationController
  
  before_action :authorize, except: [:all, :show]
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
  	@trips = current_user.trips
  end

  def show
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
  end

  def update
  	if @trip.update_attributes(trip_params)
  		redirect_to trips_path
		else
			render :edit
		end
	end

	def destroy
		@trip.destroy
		redirect_to trips_path
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
