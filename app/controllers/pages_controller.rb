class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :associations, :thanks, :aboutus]

  def home
  @animals = Animal.order("RANDOM()").limit(2)
  end

  def associations
  end

  def thanks
  end

  def aboutUs
  end
end
