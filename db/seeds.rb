Pokemon.destroy_all
Type.destroy_all

puts "Fetching data from Pokeapi and creating Pokemon... Feel free to grab a ☕, this should take about 4-5 minutes ⏱ ;)"
# pass however many pokemon you want to create from PokeApi. No arguments means that the "regular" pokemon will be created (meaning up to id 898)
CreateFromPokeapi.new.create_pokemon()
puts "Seeding complete! Created #{Pokemon.count} Pokemon out of 893"

