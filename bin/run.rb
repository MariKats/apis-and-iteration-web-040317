#!/usr/bin/env ruby

# require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/test.rb"


def run
  welcome
  character = get_character_from_user
  character_info = fetch_data("http://www.swapi.co/api/people/?search=#{character}")
  show_character_movies(character_info)
end

run
