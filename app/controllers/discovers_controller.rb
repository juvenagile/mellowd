class DiscoversController < ApplicationController
  # before_action :set_event, only: %i[show edit update destroy]

  def index
    # @events = policy_scope(Event)
    @events = Event.all
  end

end
