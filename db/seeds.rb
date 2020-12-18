Pokemon.destroy_all
Type.destroy_all
EvolutionChain.destroy_all

start_time = Time.now

puts "Fetching data from Pokeapi and creating Pokemon... Feel free to grab a ☕, this should take about 4-5 minutes ⏱ ;)"
CreateFromPokeapi.new.create_pokemon()
puts "Seeding complete! Created #{Pokemon.count} Pokemon out of 893"
CreateFromPokeapi.new.create_evolution_chains

end_time = Time.now
puts (end_time - start_time)