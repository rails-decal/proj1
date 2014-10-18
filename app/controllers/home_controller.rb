class HomeController < ApplicationController

  def index
    trainerless_pokemon = Pokemon.where(trainer:nil)
    @pokemon = trainerless_pokemon.sample
  end

end
