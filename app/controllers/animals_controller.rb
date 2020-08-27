class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @animals = Animal.global_search(params[:query])
    else
      @animals = Animal.all
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @markers = []
    @animal.habitats.each do |habitat|
      @markers << {
        lat: habitat.lat,
        lng: habitat.long
      }
    end
  end
end
