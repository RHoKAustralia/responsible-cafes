class DashboardController < ApplicationController

  def index
    authorize! :index, :dashboard
    @cup_usages = CupUsage.where(user_id: params[:user_id]).sort(:date => 1)
  end
  
end