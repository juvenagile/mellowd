class BookingsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @bookings = @event.bookings
  end
end
