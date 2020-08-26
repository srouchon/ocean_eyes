class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def associations
  end

  def thanks
  end

  def aboutUs
  end
end
