require 'rest-client'
require 'json'
require 'pry'

# def get_character_movies_from_api(character)
#   films = []
#   searched_character = RestClient.get("http://www.swapi.co/api/people/?search=#{character}")
#   searched_character_hash = JSON.parse(searched_character)
#   films_array = searched_character_hash["results"].first["films"]

#   films_array.each {|i| films << JSON.parse(RestClient.get(i))}
#   films
# end

def fetch_data(url)
  searched_character = RestClient.get(url)
  searched_character_hash = JSON.parse(searched_character)
end

def get_character_movies_from_api(character)
  films = []
  films_array = searched_character_hash["results"].first["films"]
  films_array.each {|i| films << JSON.parse(RestClient.get(i))}
  binding.pry
  films
end


def parse_character_movies(films_hash)
  films_hash.each {|movie| puts movie["title"]}
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

def run
  query = get_character_from_user
  url = "http://www.swapi.co/api/people/?search=#{query}"
  character = fetch_data(url)
  get_character_movies_from_api(character)
end

run