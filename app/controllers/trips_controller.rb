class TripsController < ApplicationController
  
  before_action :authorize, except: [:all, :show]

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

  	current_user.trips << @trip

  	if @trip.valid?
  		redirect_to trips_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @trip.save
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

	def set_user
		@trip = Trip.find(params[:id])
	end

	def trip_params
		params.require(:trip).permit(:place, :startdate, :enddate, :about)
	end
end
