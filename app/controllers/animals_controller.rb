class AnimalsController < ApplicationController
  def index
    if params[:query].present?
      @animals = Animal.global_search(params[:query])
    else
      @animals = Animal.all
    end
  end

  def show
    @animal = Animal.find(params[:id])
  end
end
