class BookingsController < ApplicationController
  before_action :set_event, only: %i[new create edit update show]
  before_action :set_booking, only: %i[show destroy]

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @event = Event.find(params[:event_id])

    if current_user.artist?
      @booking.event = @event
      @booking.user = current_user
      authorize @booking

      if @booking.save
        redirect_to event_booking_path(@booking.event, @booking), status: :see_other, notice: 'Booking was successfully created.'
      else
        render :new
      end
    else
      redirect_to @event, alert: 'Only artists can apply to events.'
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
  end

  def destroy
    @booking.destroy
    authorize @booking
    redirect_to events_path, status: :see_other
  end

  def my_bookings
    @my_bookings = current_user.bookings
    authorize @my_bookings
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
