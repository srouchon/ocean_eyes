class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_before_action :authenticate_user!, only: :animals
  def home
  end

  def associations
  end

  def thanks
  end

  def aboutUs
  end
end
