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

  def edit

    puts params[:id]

    # return flash.now[:error] = "You can't edit events you didn't create" unless current_user == @event.creator
  end

  def destroy

  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
