require 'test_helper'

class PokemonTest < ActiveSupport::TestCase
  test "bulbasaur created successfully" do
    pokemon = Pokemon.find(1)
    assert_equal "bulbasaur", pokemon.name
    assert_equal 7, pokemon.height
    assert_equal 69, pokemon.weight
    assert_equal "bulbasaur", pokemon.species
    assert_equal 45, pokemon.hp
    assert_equal 49, pokemon.attack
    assert_equal 49, pokemon.defense
    assert_equal 65, pokemon.special_attack
    assert_equal 65, pokemon.special_defense
    assert_equal 65, pokemon.speed
    assert_equal "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", pokemon.sprite_url
    assert_equal ["overgrow", "chlorophyll"], pokemon.abilities
    assert_equal ["grass", "poison"], pokemon.types
    assert_equal "A strange seed was planted on its back at birth.The plant sprouts and grows with this Pokémon.", pokemon.description
  end

  test "ivysaur created successfully" do
    pokemon = Pokemon.find(2)
    assert_equal "ivysaur", pokemon.name
    assert_equal 10, pokemon.height
    assert_equal 130, pokemon.weight
    assert_equal "ivysaur", pokemon.species
    assert_equal 60, pokemon.hp
    assert_equal 62, pokemon.attack
    assert_equal 63, pokemon.defense
    assert_equal 80, pokemon.special_attack
    assert_equal 80, pokemon.special_defense
    assert_equal 80, pokemon.speed
    assert_equal "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png", pokemon.sprite_url
    assert_equal ["overgrow", "chlorophyll"], pokemon.abilities
    assert_equal ["grass", "poison"], pokemon.types
    assert_equal "When the bulb on its back grows large, it  appearsto lose the ability to stand on its hind legs.", pokemon.description
  end

  test "venusaur created successfully" do
    pokemon = Pokemon.find(3)
    assert_equal "venusaur", pokemon.name
    assert_equal 20, pokemon.height
    assert_equal 1000, pokemon.weight
    assert_equal "venusaur", pokemon.species
    assert_equal 80, pokemon.hp
    assert_equal 82, pokemon.attack
    assert_equal 83, pokemon.defense
    assert_equal 100, pokemon.special_attack
    assert_equal 100, pokemon.special_defense
    assert_equal 100, pokemon.speed
    assert_equal "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png", pokemon.sprite_url
    assert_equal ["overgrow", "chlorophyll"], pokemon.abilities
    assert_equal ["grass", "poison"], pokemon.types
    assert_equal "The plant blooms when it is absorbing  solarenergy. It stays on the move to seek sunlight.", pokemon.description
  end
end
