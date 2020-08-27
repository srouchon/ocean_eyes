class AnimalsController < ApplicationController
  def index
    if params[:query].present?
      @animals = Animal.global_search(params[:query])
      @markers = @animals.geocoded.map do |animal|
        {
          lat: animal.habitats.first.lat,
          lng: animal.habitats.first.long
        }
      end
      raise
    else
      @animals = Animal.all
      @markers = @animals.geocoded.map do |animal|
        {
          lat: animal.habitats.first.lat,
          lng: animal.habitats.first.long
        }
        raise
      end
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @markers =
        {
          lat: @animal.habitats.first.lat,
          lng: @animal.habitats.first.long
        }
        raise

  end
end
