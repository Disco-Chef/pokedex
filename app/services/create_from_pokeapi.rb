class CreateFromPokeapi
  #will expand and make it more modular if I find i need to get data from other objects (possibly held items, moves etc?)
  def create_pokemon(pokemon_count = nil)
    # limit to "regular" pokemon that I 'member, for now. Won't deal with all the new pokemon names with with all the dashes and forms. Yet.
    create_types
    all_pokemon_count = 893
    (1..(pokemon_count.nil? ? all_pokemon_count : pokemon_count)).to_a.each do |pokemon_id|
      pokemon_data = JSON.parse(RestClient.get("#{@base_url}/pokemon/#{pokemon_id}"))
      pokemon_build_attributes = {
        name: pokemon_data['name'],
        description: fetch_description_from_pokemon_species_endpoint(pokemon_id),
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
        sprite_url: pokemon_data['sprites']['other']['official-artwork']['front_default']
      }
      p Pokemon.create(pokemon_build_attributes)
      pokemon_data['types'].each do |type|
        p PokemonType.create(pokemon_id: pokemon_id, type_id: Type.find_by(name: type['type']['name']).id)
      end
    end
  end

  def create_types
    @base_url = 'https://pokeapi.co/api/v2'
    (1..18).to_a.each do |type_id|
      type_data = JSON.parse(RestClient.get("#{@base_url}/type/#{type_id}"))
      type_build_attributes = {
        name: type_data['name']
      }
      p Type.create(type_build_attributes)
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

  def fetch_description_from_pokemon_species_endpoint(pokemon_id)
    species_data = JSON.parse(RestClient.get("#{@base_url}/pokemon-species/#{pokemon_id}"))
    species_data["flavor_text_entries"].each do |text_entry|
      if text_entry.dig("language", "name") == "en"
        return text_entry["flavor_text"].gsub("\n", " ").gsub("POKéMON", "Pokémon").gsub("\f", " ")
      end
    end
  end

  def create_evolution_chains
    chain_hash = {}
    @base_url = 'https://pokeapi.co/api/v2'
    (1..470).to_a.each do |evolution_id|
      response = RestClient.get("#{@base_url}/evolution-chain/#{evolution_id}") { |response, request, result, &block|
        case response.code
        when 200
          chain_data = JSON.parse(response)
          chain_starting_pokemon = chain_data["chain"]["species"]["name"]
          chain_hash["first"] = [chain_starting_pokemon]
          if chain_data["chain"]["evolves_to"].present?
            second_level_pokemons = []
            third_level_pokemons = []
            chain_data["chain"]["evolves_to"].each do |second_level_evolution|
              second_level_pokemon = second_level_evolution["species"]["name"]
              second_level_pokemons << second_level_pokemon
              if second_level_evolution["evolves_to"].present?
                second_level_evolution["evolves_to"].each do |third_level_evolution|
                  third_level_pokemon = third_level_evolution["species"]["name"]
                  third_level_pokemons << third_level_pokemon
                end
              end
            end
          end
        when 404
          next
        end
        chain_hash["second"] = second_level_pokemons
        chain_hash["third"] = third_level_pokemons
        chain_instance = EvolutionChain.create(chain_json: chain_hash)
        associate_pokemon_to_chain(chain_hash, chain_instance)
      }
    end
  end

  def associate_pokemon_to_chain(chain_hash, chain_instance)
    #{first: [..]. second: [..], third: [..]}
    # {"first"=>["bulbasaur"], "second"=>["ivysaur"], "third"=>["venusaur"]}
    @counter = 1 unless @counter
    puts @counter
    puts chain_hash
    chain_hash.each_value do |pokemon_array_in_level|
      if pokemon_array_in_level.present?
        pokemon_array_in_level.each do |species_name|
          # pokeapi inconsistent naming. deoxys => deoxys-normal
          Pokemon.find_by(species: species_name).update(evolution_chain: chain_instance)
        end
      end
    end
    @counter += 1
  end
end
