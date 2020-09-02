class HabitatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @habitats = Habitat.all
    @markers = []
    @habitats.each do |habitat|
      @markers << {
        lat: habitat.lat,
        lng: habitat.long
      }
    end
  end
end
