class PagesController < ApplicationController
  skip_authorization_check

  def home
  end

  def aggregate
    @cup_usages = CupUsage.all
  end

  def cafes
    @cafes = User.all
  end
end
