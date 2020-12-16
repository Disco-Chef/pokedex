class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show]

  def index
    if params[:query].present?
      # ".. OR description ILIKE :query" too?
      sql_query = "name ILIKE :query"
      @pokemons = Pokemon.where(sql_query, query: "%#{params[:query]}%")
    else
      @pokemons = Pokemon.all
    end
  end

  def show
  end

  def send_favorites
    # raise
    # redirect_to favorites_path
  end

  def favorites

  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
