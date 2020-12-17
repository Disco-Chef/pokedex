class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show]

  def index
    if params["/pokemons"].present?
      # ".. OR description ILIKE :query" too?
      if params["/pokemons"]["name"].present?
      sql_query = "name ILIKE :name"
      @pokemons = Pokemon.where(sql_query, name: "%#{params['/pokemons'][:name]}%")
      end
    else
      @pokemons = Pokemon.all
    end
  end

  def show
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
