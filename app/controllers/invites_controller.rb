class InvitesController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])

    @event.invitees << @user
    flash[:success] = "#{@user.user_name} is now invited."

    redirect_to event_path(@event.id)
  end
end
