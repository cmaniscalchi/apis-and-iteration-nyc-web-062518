require 'rest-client'
require 'json'
require 'pry'

  #make a web request to return an array containing character data from all pages in the API documentation

def get_character_movies_from_api(character)
  #make the web request
  array_of_characters = []
  x = 1
  while x < 9
    characters = RestClient.get("http://www.swapi.co/api/people/?page=" + "#{x}")
    hash = JSON.parse(characters)
    array_of_characters << hash["results"]
    x += 1
  end

  array_of_characters.flatten!

  film_array = array_of_characters.map do |character_info|
      character_info["films"] if character_info["name"] == character
    end

  film_array.delete_if {|film| film == nil }

  film_array.flatten!

  films_hash = film_array.map do |film|
    unparsed = RestClient.get(film)
    parsed = JSON.parse(unparsed)
  end
end

# some iteration magic and puts out the movies in a nice list

def parse_character_movies(films_hash)
  films_hash.each_with_index do |film, index|
    p "#{index + 1} #{film["title"]}"
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
