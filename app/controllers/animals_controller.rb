class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @animals = Animal.global_search(params[:query])
      # @markers = @animals.geocoded.map do |animal|
      #   {
      #     lat: animal.habitats.lat,
      #     lng: animal.habitats.long
      #   }
      # end
    else
      @animals = Animal.all
      # @markers = @animals.geocoded.map do |animal|
      #   {
      #     lat: animal.habitats.lat,
      #     lng: animal.habitats.long
      #   }
      # end
    end
  end

  def show
    @animal = Animal.find(params[:id])
    # @markers = []
    raise
    @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.habitats.lat,
        lng: animal.habitats.long
      }
    end
    @animal.habitats.each do |habitat|
      @markers << {
        lat: habitat.lat,
        lng: habitat.long
      }
    end
  end

  # def show
  #   @animal = Animal.find(params[:id])
  #   @markers = []
  #   @animal.habitats.each do |habitat|
  #     @markers << {
  #       lat: habitat.lat,
  #       lng: habitat.long
  #     }
  #   end
  # end
end
