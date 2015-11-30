class PagesController < ApplicationController
  skip_authorization_check

  def home
    @cafes = User.all
    @cup_usages = CupUsage.all
    @total_cups_saved = @cup_usages.reduce(0) {|sum, cup_usage| sum + cup_usage.reusable_cups + cup_usage.dine_in_cups }


    @cup_usages_last_month = CupUsage.where(month: Date.today.month - 1, year: Date.today.year)
    @total_cups_saved_last_month = @cup_usages_last_month.reduce(0) {|sum, cup_usage| sum + cup_usage.reusable_cups + cup_usage.dine_in_cups }

  end
end
