class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :dashboard

  def dashboard
    skip_authorization
    @user = current_user
    @user = User.find(params[:id])
  end

  def show
    skip_authorization
  end
end
