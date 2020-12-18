class CreateEvolutionChains < ActiveRecord::Migration[6.0]
  def change
    create_table :evolution_chains do |t|
      t.json :chain_json

      t.timestamps
    end
  end
end
