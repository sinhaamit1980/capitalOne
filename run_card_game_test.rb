require File.join(File.dirname(__FILE__),'card_game')


test_file = ARGV[0]

puts "Using Test file : #{test_file}"
card_game = CardGame.new
card_game.read_file_and_validate_winner(test_file)