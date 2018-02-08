class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    if @event.save
      flash[:success] = "événement crée!"
      redirect_to event_path
    else render 'new'
    end

  end
def index
  	@events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  
  	def event_params
      params.require(:event).permit(:description, :place, :date)
end
end
