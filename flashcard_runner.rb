require_relative './lib/card'
require_relative './lib/turn'
require_relative './lib/deck' 
require_relative './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

puts "Welcome to Flashcards! You're playing with #{deck.count} cards."
puts "-------------------------------------------------"

until round.deck.cards.empty?
  current_card = round.current_card
  puts "Question: #{current_card.question}"

  user_guess = gets.chomp
  round.take_turn(user_guess)

  puts "Feedback: #{round.turns.last.feedback}"
  puts "-------------------------------------------------"
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.round(2)}%."
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
