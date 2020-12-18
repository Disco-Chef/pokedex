class AddEvolutionChainReferencesToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_reference :pokemons, :evolution_chain, null: true, foreign_key: true
  end
end
