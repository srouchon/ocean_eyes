class AnimalsController < ApplicationController
  def index
    if params[:query].present?
      @animals = Animal.search_by_common_name_by_latin_name_and_description(params[:query])
    else
      @animals = Animal.all
    end
  end

  def show
    @animal = Animal.find(params[:id])
  end
end
