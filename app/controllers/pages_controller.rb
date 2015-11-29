class PagesController < ApplicationController
  skip_authorization_check

  def home
  end

  def aggregate
  end

  def cafes
    @cafes = User.all
    @cup_usages = CupUsage.all
    @total_cups_saved = @cup_usages.reduce(0) {|sum, cup_usage| sum + cup_usage.reusable_cups + cup_usage.dine_in_cups }
  end
end
