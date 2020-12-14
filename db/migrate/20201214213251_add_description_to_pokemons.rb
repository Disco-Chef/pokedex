class AddDescriptionToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :description, :text
  end
end
