class AnimalsController < ApplicationController
  def index
    if params[:query].present?
      @animals = Animal.global_search(params[:query])
      @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.habitat.lat,
        lng: animal.habitat.long
      }
    end
    else
      @animals = Animal.all
    end
  end

  def show
    @animal = Animal.find(params[:id])
  end
end
