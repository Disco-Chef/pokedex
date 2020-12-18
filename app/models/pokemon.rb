class Pokemon < ApplicationRecord
  has_many :pokemon_types, dependent: :destroy
  has_many :types, through: :pokemon_types
  belongs_to :evolution_chain, class_name: "EvolutionChain", foreign_key: :evolution_chain_id, primary_key: :id, optional: true
end
