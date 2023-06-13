class DiscoversController < ApplicationController
  before_action :set_discover, only: %i[show edit destroy]

  def index
    @discovers = policy_scope(Discover)
    @discovers = Discover.all
  end

  def show
    @discover = Discover.find(params[:id])
  end

  def new
    @discover = Discover.new
  end

  def edit; end

  def create
    @discover = Discover.new(discover_params)
    @discover.user = current_user
    authorize @discover

    if @discover.save
      redirect_to @discover, notice: "Content was made."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @discover.destroy
    authorize @discover
    redirect_to discovers_url, notice: "Content was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @discover = Discover.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def discover_params
    params.require(:discover).permit(:content, :likes, :plays, :saved, :start_time, :end_time, :user_id, :title)
  end
end
