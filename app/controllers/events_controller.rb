class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end

end
