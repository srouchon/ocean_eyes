class HabitatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animals = Animal.all
    @markers = []
    @habitats = []
    @animals.each do |animal|
      @habitats << animal.habitats
    end
    @habitats.each do |habitat|
      @markers << {
        lat: habitat[:lat],
        lng: habitat[:long]
      }
    end
  end
end
