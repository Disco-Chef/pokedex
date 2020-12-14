pokemon_count = 898

@results = []
@base_url = 'https://pokeapi.co/api/v2/ability'
# limit to "regular" pokemon I 'member. Won't deal with all the new pokemon names with with all the dashes and forms
(1..898).to_a.each do |pokemon_id|
  pokemon_data = JSON.parse(RestClient.get("#{@base_url}/#{pokemon_id}"))
  puts pokemon_data

end

