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
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @creator = @event.creator

    unless @creator == current_user
      flash[:error] = "You must be the Happening Creator to Edit."
      puts "You must be the Happening Creator to Edit."
      return redirect_to event_path(@event)
    end

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @creator = @event.creator

    unless @creator == current_user
      flash[:error] = "You must be the Happening Creator to Delete."
      puts "You must be the Happening Creator to Delete."
      return redirect_to event_path(@event)
    end

    @event.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :private)
  end
end
