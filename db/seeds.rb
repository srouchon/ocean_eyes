# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "uri"
require "net/http"

puts 'clean DB'
Animal.destroy_all
Habitat.destroy_all

# queries on Fishbase API

response_allfish_body = {}
response_mammals_body = {}

url_allfish = URI("https://fishbase.ropensci.org/species?&limit=500")
url_mammals = URI("https://fishbase.ropensci.org/sealifebase/species?&limit=500")

https_allfish = Net::HTTP.new(url_allfish.host, url_allfish.port);
https_allfish.use_ssl = true

https_mammals = Net::HTTP.new(url_mammals.host, url_mammals.port);
https_mammals.use_ssl = true

request_allfish = Net::HTTP::Get.new(url_allfish)
response_allfish = https_allfish.request(request_allfish)
response_allfish_body = JSON.parse(response_allfish.read_body)

request_mammals = Net::HTTP::Get.new(url_mammals)
response_mammals = https_mammals.request(request_mammals)
response_mammals_body = JSON.parse(response_mammals.read_body)


allfish = response_allfish_body['data']
mammals = response_mammals_body["data"]

animals = allfish + mammals

# queries on GBIF API

def parse_gbif_api(animal)
  response_habitats_body = {}
  url_habitats_infos = URI("https://api.gbif.org/v1/occurrence/search?scientificName=#{animal[:latin_name]}&limit=10")

  https_habitats_infos = Net::HTTP.new(url_habitats_infos.host, url_habitats_infos.port);
  https_habitats_infos.use_ssl = true

  request_habitats_infos = Net::HTTP::Get.new(url_habitats_infos)
  response_habitats_infos = https_habitats_infos.request(request_habitats_infos)
  response_habitats_infos_body = JSON.parse(response_habitats_infos.read_body)

  habitats_infos = response_habitats_infos_body['results']

  habitats_infos.each do |result|
    if animal[:latin_name] == result["species"]
      bbb = Habitat.create!(animal_id: animal.id, long: result["decimalLongitude"], lat: result["decimalLatitude"])
    else
      puts 'not added habitat'
    end
  end
end

# seed

animals.each do |animal|
  unless animal["Genus"] == nil || animal["Species"] == nil || animal["FBname"] == nil || animal["image"] == nil
    a = Animal.create(common_name: animal["FBname"], latin_name: "#{animal["Genus"]} #{animal["Species"]}", description: animal["Comments"], image: animal["image"])
    puts "Animal = #{a.latin_name}"
    parse_gbif_api(a)
    puts 'habitat added'
  end
end

# manually adding barramundi
barra_description = "Dorsal spines (total): 7 - 9; Dorsal soft rays (total): 10-11; Anal spines: 3; Anal soft rays: 7 - 8. Body elongate; mouth large, slightly oblique, upper jaw extending behind the eye. Lower edge of preopercle serrated, with strong spine at its angle; opercle with a small spine and with a serrated flap above the origin of the lateral line. Caudal fin rounded."

barramundi = Animal.create(common_name: "Barramundi", latin_name: "Lates calcarifer", description: barra_description, image: "https://www.fishbase.ca/images/species/Lacal_u1.gif")

puts 'finished'
