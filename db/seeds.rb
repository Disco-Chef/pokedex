Pokemon.destroy_all
puts "Fetching data from Pokeapi and seeding Pokemon..."
# pass however many pokemon you want to create from PokeApi. No arguments means that the "regular" pokemon will be created (meaning up to id 898)
CreateFromPokeapi.new.create_pokemon()
puts "Seeding complete! Created #{Pokemon.count} Pokemon out of 898"
