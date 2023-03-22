class InvitesController < ApplicationController
  def new
    @invite = Invite.new

    redirect_to root_path
  end

  def create
    @invite = Invite.new
    redirect_to root_path
  end
end

# @event = Event.find(params[:id])
    # if @event.attendees.include?(current_user)
    #   flash[:error] = "You are already attending: #{@event.title}"
    # else
    #   @event.attendees << current_user
    #   flash[:success] = "You are now attending happening: #{@event.title}"
    # end
    # redirect_to event_path(@event.id)
