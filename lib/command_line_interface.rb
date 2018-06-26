require 'pry'
require_relative './api_communicator.rb'

def welcome
  # puts out a welcome message here!
  puts "Hello! This program will tell you which movies your favorite Star Wars™ character has appeared in."
end

def get_character_from_user
  puts "Please enter a character's full name."
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp
end

def run
 welcome
 character = get_character_from_user
 show_character_movies(character)
end

run
