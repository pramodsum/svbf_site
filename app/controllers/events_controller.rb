class EventsController < ApplicationController
	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)

		if @event.save
			redirect_to action: "index"
		else 
			render :action => 'new'
		end
	end

	def index
		@events = Event.all.order('created_at DESC')
	end

	def show
	  @event = Event.find(params[:id])
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to action: "index"
		flash[:error] = "Event was deleted!"
	end
 
  private
	def event_params
		params.require(:event).permit(:title, :description, :start_time, :end_time)
	end
end
