# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "uri"
require "net/http"

@response_body = {}

url = URI("https://fishbase.ropensci.org/species?&limit=5")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)

@response_body = response.read_body

byebug



# iterer sur response_body
# aller sur les pages suivantes
# dans array, liste species
