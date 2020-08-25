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

response_allfish_body = {}
response_mammals_body = {}

url_allfish = URI("https://fishbase.ropensci.org/species?&limit=3000")
url_mammals = URI("https://fishbase.ropensci.org/sealifebase/species?&limit=3000")

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

animals.each do |animal|
  unless animal["Genus"] == nil || animal["Species"] == nil || animal["FBname"] == nil || animal["image"] == nil
    Animal.create(common_name: animal["FBname"], latin_name: "#{animal["Genus"]} #{animal["Species"]}", description: animal["Comments"], image: animal["image"] )
  end
end

# allfish.each do |fish|
#   unless fish["Genus"] == nil || fish["Species"] == nil || fish["FBname"] == nil
#     Animal.create(common_name: fish["FBname"], latin_name: "#{fish["Genus"]} #{fish["Species"]}", description: fish["Comments"], image: fish["image"] )
#   end
# end

# mammals.each do |mammal|
#   unless mammal["Genus"] == nil || mammal["Species"] == nil || mammal["FBname"] == nil
#     Animal.create(common_name: mammal["FBname"], latin_name: "#{mammal["Genus"]} #{mammal["Species"]}", description: mammal["Comments"], image: mammal["image"] )
#   end
# end


#puts response_body["data"][0]["Genus"] + [Species]

# iterer sur response_body
# aller sur les pages suivantes
# dans array, liste species

# puts 'index some animals'
# a = Animal.create!(common_name: 'crevette pistolet tigre', latin_name: 'Alpheus bellulus', description: "La crevette pistolet tigre a la forme d'un petit homard avec un corps blanc strié de bandes marron orangé tachetées de blanc.")
# Animal.create!(common_name: 'dauphin commun', latin_name: 'Delphinus delphis', description: "Le dauphin commun est gris foncé à noir sur le dos, blanc jaunâtre sur les flancs. Il a un dessin en forme de sablier et une ligne foncé allant de la nageoire pectorale au bec.")
# Animal.create!(common_name: 'baleine à bosse', latin_name: 'Megaptera novaeangliae', description: "Le dessus du corps des baleines à bosse est entièrement noir, le dessous est plutôt blanchâtre. La tête et la mâchoire inférieure sont couvertes de petites protubérances appelées tubercules. Les nageoires pectorales, noires et blanches, peuvent atteindre jusqu'au tiers de la longueur du corps. ")
# Animal.create!(common_name: 'raie pastenague épineuse', latin_name: 'Dasyatis centroura ', description: "La raie pastenague épineuse a le corps en forme de losange arrondi de couleur gris clair à foncé ou gris olivâtre. Des tubercules sont présents sur le dessus du corps. Sa tête a un museau pointu et de petits yeux.")

puts 'finished'
