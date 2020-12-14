pokemon_count = 898

# pokemon_data , "type" or "ability"
def build_array_attribute(data_hash, attribute)
  if data_hash[attribute.pluralize].count == 1
    return  [ data_hash[attribute.pluralize].first[attribute]['name'] ]
  else
    return  [ data_hash[attribute.pluralize].first[attribute]['name'], data_hash[attribute.pluralize].last[attribute]['name'] ]
  end
end
@results = []
@base_url = 'https://pokeapi.co/api/v2/pokemon'
# limit to "regular" pokemon I 'member. Won't deal with all the new pokemon names with with all the dashes and forms
(1..898).to_a.each do |pokemon_id|
  puts "#{@base_url}/#{pokemon_id}"
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
  p Pokemon.create(pokemon_build_attributes)
end

