class CreateFromPokeapi
  #will expand and make it more modular if I find i need to get data from other objects (possibly held items, moves etc?)
  def create_pokemon(pokemon_count = nil)
    # limit to "regular" pokemon that I 'member, for now. Won't deal with all the new pokemon names with with all the dashes and forms. Yet.
    # need to skip from 898 to 1001
    all_pokemon_count = 898
    @base_url = 'https://pokeapi.co/api/v2/pokemon'
    (1..(pokemon_count.nil? ? all_pokemon_count : pokemon_count)).to_a.each do |pokemon_id|
      pokemon_data = JSON.parse(RestClient.get("#{@base_url}/#{pokemon_id}"))
      pokemon_build_attributes = {
        name: pokemon_data['name'],
        abilities: build_array_attribute(pokemon_data, "ability"),
        height: pokemon_data['height'],
        weight: pokemon_data['weight'],
        species: pokemon_data['species']['name'],
        hp: pokemon_data['stats'][0]['base_stat'],
        attack: pokemon_data['stats'][1]['base_stat'],
        defense: pokemon_data['stats'][2]['base_stat'],
        special_attack: pokemon_data['stats'][3]['base_stat'],
        special_defense: pokemon_data['stats'][4]['base_stat'],
        speed: pokemon_data['stats'][4]['base_stat'],
        types: build_array_attribute(pokemon_data, "type"),
        sprite_url: pokemon_data['sprites']['front_default']
      }
      Pokemon.create(pokemon_build_attributes)
    end
  end

  def build_array_attribute(data_hash, attribute)
    array_from_data = data_hash[attribute.pluralize]
    if array_from_data.count == 1
      return  [array_from_data.first[attribute]['name']]
    else
      return  [array_from_data.first[attribute]['name'], array_from_data.last[attribute]['name']]
    end
  end
end
