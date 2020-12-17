class RemoveTypesFromPokemons < ActiveRecord::Migration[6.0]
  def change
    remove_column :pokemons, :types
  end
end
