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

  def suscribe
    @event = Event.find(params[:id])
    if
      @event.attendees.include? current_user
      flash[:error] = "Vous participez déjà à l'événement !"
      redirect_to @event
    else
      @event.attendees << current_user
      flash[:success] = "Vous participez à l'événement !"
      redirect_to @event
    end
  end

  def adduser
    @user = User.find(params[:id])
    @event = Event.find(params[:test])
    @event.attendees << @user
    flash[:success] = "#{@user.email} est ajouté à l'événement ! !"
    redirect_to @event

  end

end
