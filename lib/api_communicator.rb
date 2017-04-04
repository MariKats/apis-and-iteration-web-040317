require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  films = []
  searched_character = RestClient.get("http://www.swapi.co/api/people/?search=#{character}")
  searched_character_hash = JSON.parse(searched_character)
  films_array = searched_character_hash["results"].first["films"]

  films_array.each {|i| films << JSON.parse(RestClient.get(i))}
  films
end

def parse_character_movies(films_hash)
  films_hash.each {|movie| puts movie["title"]}
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


