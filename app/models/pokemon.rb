class Pokemon < ApplicationRecord
  has_many :types, through: :pokemon_types
end
