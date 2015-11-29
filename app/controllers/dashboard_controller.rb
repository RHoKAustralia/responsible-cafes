class DashboardController < ApplicationController
  skip_authorization_check

  def index
    authorize! :index, :dashboard
    @cafe = User.find(params[:user_id])
    @cup_usages = CupUsage.where(user_id: params[:user_id]).sort(:month => 1)

    @total_cups_saved = @cup_usages.reduce(0) {|sum, cup_usage| sum + cup_usage.reusable_cups + cup_usage.dine_in_cups }
  end
  
end