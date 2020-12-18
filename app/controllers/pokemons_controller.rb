class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show]

  def index
    if params[:search].present?
      # ".. OR description ILIKE :query" too?
      if params[:search]["name"].present? && params[:search]["type"].present?
        sql_query = "pokemons.name ILIKE :name \
                    AND types.name LIKE :type"
        @pokemons = Pokemon.joins(:types).where(sql_query, name: "%#{params[:search]["name"]}%", type: params[:search]["type"]).order(:id)
      elsif params[:search]["name"].present? && !params[:search]["type"].present?
        sql_query = "pokemons.name ILIKE :name"
        @pokemons = Pokemon.joins(:types).where(sql_query, name: "%#{params[:search]["name"]}%").order(:id).uniq
      elsif !params[:search]["name"].present? && params[:search]["type"].present?
        sql_query = "types.name LIKE :type"
        @pokemons = Pokemon.joins(:types).where(sql_query, type: params[:search]["type"]).order(:id)
      else
        @pokemons = Pokemon.all.order(:id)
      end
    else
      @pokemons = Pokemon.all.order(:id)
    end
  end

  def show
    @evolution_chain = {first: [], second: [], third: []}
    @pokemon.evolution_chain.chain_json.each do |key, pokemon_array_in_level|
      if pokemon_array_in_level.present?
        pokemon_array_in_level.each do |species_name|
          # pokeapi inconsistent naming. deoxys => deoxys-normal
          @evolution_chain[key.to_sym] << Pokemon.find_by(species: species_name)
        end
      end
    end
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
