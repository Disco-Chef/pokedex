class RenameSpecialDefenceToSpecialDefenseInPokemons < ActiveRecord::Migration[6.0]
  def change
    rename_column :pokemons, :special_defence, :special_defense
  end
end
