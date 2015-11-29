class DashboardController < ApplicationController
  skip_authorization_check

  def index
    authorize! :index, :dashboard
    @cafe = User.find(params[:user_id])
    @cup_usages = CupUsage.where(user_id: params[:user_id]).sort(:month => 1)
  end
  
end