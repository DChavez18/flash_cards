require './lib/card_generator'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


filename = "cards.txt"

cards = CardGenerator.new(filename).cards