class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
     # need to figure out link but method is
     # @event = Event.find(params[:id]).attendees << current_user
     flash.now[:success] = "???"
     redirect_to root_path


  end

  def edit
    flash[:success] = "This worked???"
    redirect_to root_path

    #TODO so this works, I can get button to listen to me but not actually with update yet
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end

end
