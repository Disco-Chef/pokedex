class AddTypesAndAbilitiesToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :abilities, :string, array: true, default: []
    add_column :pokemons, :types, :string, array: true, default: []
  end
end
