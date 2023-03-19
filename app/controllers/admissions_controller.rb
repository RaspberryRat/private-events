class AdmissionsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    if @event.attendees.include?(current_user)
      flash[:error] = "You are already attending: #{@event.title}"
    else
      @event.attendees << current_user
      flash[:success] = "You are now attending happening: #{@event.title}"
    end
    redirect_to event_path(@event.id)
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      @event.admissions.delete(@event.admissions.where(attendee_id: current_user.id))
      flash[:success] = "You are no longer attending: #{@event.title}"
    else
      flash[:error] = "You are not attending: #{@event.title}"
    end
    redirect_to event_path(@event.id)
  end
end
