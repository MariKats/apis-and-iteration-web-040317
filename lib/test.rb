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
  if searched_character_hash["count"] > 1
    puts "Did you mean:"
    searched_character_hash["results"].each {|x| puts x["name"]} 
    puts "*" * 30
    recheck
    films
  else
    films_array = searched_character_hash["results"].first["films"]
    films_array.each {|i| films << JSON.parse(RestClient.get(i))}
    films
  end
end

def recheck
  character = get_character_from_user
  character_info = fetch_data("http://www.swapi.co/api/people/?search=#{character}")
  show_character_movies(character_info)
end

def parse_character_movies(films_hash)
  films_hash.each {|movie| puts movie["title"]}
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
