require 'rest-client'
require 'json'
require 'pry'


def fetch_data(url)
  searched_character = RestClient.get(url)
  searched_character_hash = JSON.parse(searched_character)
  searched_character_hash
end

def get_character_movies_from_api(searched_character_hash)
  films = []
  films_array = searched_character_hash["results"].first["films"]
  films_array.each {|i| films << JSON.parse(RestClient.get(i))}
  films
end

def parse_character_movies(films_hash)
  films_hash.each {|movie| puts movie["title"]}
end

def show_character_movies(searched_character_hash)
  films_hash = get_character_movies_from_api(searched_character_hash)
  parse_character_movies(films_hash)
end
