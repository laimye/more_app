class AnnouncementsController < ApplicationController

before_action :set_announcement, only: [:show, :edit, :update, :destroy]

		def index
			if params[:sort]
				@announcements = Announcement.order(params[:sort])
			else
				@announcements = Announcement.all
			end
		end

		def show
		end

		def edit
		end

		def new
			@announcement = Announcement.new
			@trip = Trip.find(params[:trip_id])
		end

		def create
			@announcement = Announcement.new(announcement_params)
			@announcement.trip_id = params[:trip_id]
			@announcement.user_id = current_user.id
			if @announcement.save
				redirect_to @announcement.trip, notice: 'Your announcement was published!'
			else
				render :new
			end
		end


		def update
			if @announcement.update_attributes(announcement_params)
				redirect_to @announcement.trip, notice: 'Your announcement was succesfully updated!'
			else
				render :edit
			end
		end

		def destroy
			@announcement.destroy
			redirect_to @announcement.trip, notice: 'Your announcement was succesfully deleted!'
		end

		private

		def set_announcement
			@announcement = Announcement.find(params[:id])
		end

		def announcement_params
			params.require(:announcement).permit(:content, :user_id, :trip_id)
		end

	end