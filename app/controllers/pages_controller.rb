class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :associations, :thanks, :aboutUs]

  def home
  end

  def associations
  end

  def thanks
  end

  def aboutUs
  end
end
