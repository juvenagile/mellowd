class DashboardsController < ApplicationController
  def show
    skip_authorization
    @dashboard = Dashboard.find(params[:id])
    @users = @dashboard.users
  end
end
