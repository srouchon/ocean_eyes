
puts 'clean DB'
Animal.destroy_all


puts 'index some animals'
a = Animal.create!(common_name: 'crevette pistolet tigre', latin_name: 'Alpheus bellulus', description: "La crevette pistolet tigre a la forme d'un petit homard avec un corps blanc strié de bandes marron orangé tachetées de blanc.")
Animal.create!(common_name: 'dauphin commun', latin_name: 'Delphinus delphis', description: "Le dauphin commun est gris foncé à noir sur le dos, blanc jaunâtre sur les flancs. Il a un dessin en forme de sablier et une ligne foncé allant de la nageoire pectorale au bec.")
Animal.create!(common_name: 'baleine à bosse', latin_name: 'Megaptera novaeangliae', description: "Le dessus du corps des baleines à bosse est entièrement noir, le dessous est plutôt blanchâtre. La tête et la mâchoire inférieure sont couvertes de petites protubérances appelées tubercules. Les nageoires pectorales, noires et blanches, peuvent atteindre jusqu'au tiers de la longueur du corps. ")
Animal.create!(common_name: 'raie pastenague épineuse', latin_name: 'Dasyatis centroura ', description: "La raie pastenague épineuse a le corps en forme de losange arrondi de couleur gris clair à foncé ou gris olivâtre. Des tubercules sont présents sur le dessus du corps. Sa tête a un museau pointu et de petits yeux.")


puts 'finished'
