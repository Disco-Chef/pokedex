# pokemon_count = 898
Pokemon.destroy_all
puts "Fetching data from Pokeapi and seeding Pokemon..."
CreateFromPokeapi.new.create_pokemon(10)
puts "Seeding complete! Created #{Pokemon.count} Pokemon out of 898"
