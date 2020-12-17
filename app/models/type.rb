class Type < ApplicationRecord
  has_many :pokemons, through: :pokemon_types
end
