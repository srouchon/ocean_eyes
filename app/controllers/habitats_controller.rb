class HabitatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @habitats = Habitat.order(Arel.sql('RANDOM()')).first(10)
    @markers = []
    @habitats.each do |habitat|
      @markers << {
        lat: habitat.lat,
        lng: habitat.long,
        infoWindow: render_to_string(partial: "info_window", locals: { habitat: habitat })
      }
    end
  end
end
