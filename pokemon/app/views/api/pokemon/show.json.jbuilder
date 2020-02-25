json.pokemon do 
    json.extract @pokemon, :id, :name, :attact, :defence, :moves, :poke_type, :image_url
end


@pokemon.each do |poke|
  json.set! poke.id do
    json.extract! poke, :id, :name, :pokemon_id, :price, :happiness, :image_url
  end
end