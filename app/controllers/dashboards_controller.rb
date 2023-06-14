class DashboardsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @dashboards = policy_scope(Dashboard)
    @dashboards = Dashboard.joins(:user_dashboards).where(user_dashboards: { user_id: current_user.id })
  end

  def show
    skip_authorization
    @dashboard = Dashboard.find(params[:id])
    @users = @dashboard.users
  end

  def new
    @dashboard = Dashboard.new
    authorize @dashboard
  end

  # GET /dashboards/1/edit
  def edit
    @dashboard = Dashboard.find(params[:id])
    authorize @dashboard
  end

  # POST /dashboards
  def create
    @dashboard = Dashboard.new(dashboard_params)
    @dashboard.user = current_user
    authorize @dashboard

    if @dashboard.save!
      UserDashboard.create(user: current_user, dashboard: @dashboard)
      redirect_to @dashboard, notice: "Dashboard was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    authorize @dashboard
    if @dashboard.update(dashboard_params)
      redirect_to @dashboard, notice: "Dashboard was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /dashboards/1
  def destroy
    @dashboard.destroy
    authorize @dashboard
    redirect_to dashboards_url, notice: "Dashboard was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @dashboard = Dashboard.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dashboard_params
    params.require(:dashboard).permit(:artist_genre, :solo_or_band, :artist_count, :artist_name, :artist_instrument, :artist_location, :artist_travel, :artist_radius, :artist_cities, :artist_description, :artist_price)
  end
end
