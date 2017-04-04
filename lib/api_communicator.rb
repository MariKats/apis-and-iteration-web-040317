require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  films = []
  searched_char = RestClient.get("https://swapi.co/api/people/?search=#{character}")
  searched_char_hash = JSON.parse(searched_char)
  if searched_char_hash["count"] > 1
    puts "Did you mean:"
    searched_char_hash["results"].each{|x| puts x["name"] }
    puts "*" * 30
    recheck
  else
    films_array = searched_char_hash["results"].first["films"]
    films_array.each {|i| films << JSON.parse(RestClient.get(i))}
    films
  end
end

def recheck
  character = gets.chomp.downcase
  show_character_movies(character)
end


def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each{|movie| puts movie["title"]}


end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
