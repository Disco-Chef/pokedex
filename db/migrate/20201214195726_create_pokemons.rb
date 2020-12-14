class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :height
      t.integer :weight
      t.string :species
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defence
      t.integer :speed
      t.string :sprite_url

      t.timestamps
    end
  end
end
