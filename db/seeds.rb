puts "Fetching data from Pokeapi and creating Pokemon... Feel free to grab a ☕, this can take up to 4-5 minutes ⏱ ;)"
Pokemon.destroy_all
Type.destroy_all
EvolutionChain.destroy_all

CreateFromPokeapi.new.create_pokemon()
puts "Pokemon created! Fetching evolution data and creating the evolution-🔗"
CreateFromPokeapi.new.create_evolution_chains
puts "Evolutions created!"
