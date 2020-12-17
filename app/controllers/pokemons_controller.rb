class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show]

  def index
    if params[:search].present?
      # ".. OR description ILIKE :query" too?
      if params[:search]["name"].present? && params[:search]["type"].present?
        sql_query = "pokemons.name ILIKE :name \
                    AND types.name LIKE :type"
        @pokemons = Pokemon.joins(:types).where(sql_query, name: "%#{params[:search]["name"]}%", type: params[:search]["type"])
      elsif params[:search]["name"].present? && !params[:search]["type"].present?
        sql_query = "pokemons.name ILIKE :name"
        @pokemons = Pokemon.joins(:types).where(sql_query, name: "%#{params[:search]["name"]}%").uniq
      elsif !params[:search]["name"].present? && params[:search]["type"].present?
        sql_query = "types.name LIKE :type"
        @pokemons = Pokemon.joins(:types).where(sql_query, type: params[:search]["type"])
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
