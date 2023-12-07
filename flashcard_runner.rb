require_relative './lib/card_generator'
require_relative './lib/card'
require_relative './lib/turn'
require_relative './lib/deck' 
require_relative './lib/round'

filename = "cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
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

categories = deck.cards.map(&:category).uniq
categories.each do |category|
  category_percent = round.percent_correct_by_category(category)
  puts "#{category} - #{category_percent.round(2)}% correct"
end