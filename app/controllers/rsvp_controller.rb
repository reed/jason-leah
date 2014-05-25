class RsvpController < ApplicationController
  def index
    render :new
  end

  def new
  end

  def create
    @rsvp = Rsvp.new rsvp_attributes

    if @rsvp.save
      Bridegroom.rsvp(@rsvp).deliver
      flash[:success] = "RSVP sent!  We can't wait to see you!"
      redirect_to events_path
    else
      render action: 'new'
    end
  end

  private

  def rsvp_attributes
    params.require(:rsvp).permit :email, :guest_list, :restrictions
  end
end
