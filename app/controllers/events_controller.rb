class EventsController < ApplicationController
	def new
		@event = Event.new
		@events = Event.all
	end

	def create
	  @event = Event.new(event_params)
	  @events = Event.all

	  respond_to do |format|
	    if @event.save
	      format.html { 
	      	redirect_to @event, notice: 'Created successfully.' 
	      }
	      format.json { 
	      	render json: @event, status: :created, location: @event 
	      }
	    else
	      format.html { render action: "new" }
	      format.json { 
	      	render json: @event.errors, status: :unprocessable_entity 
	      }
	    end
	  end
	end

	def show
	  @event = Event.find(params[:id])
	end

	def index
	  @events = Event.all
	end
	 
	private
	  def event_params
	    params.require(:event).permit(:title, :date, :time, :description)
	  end
end
