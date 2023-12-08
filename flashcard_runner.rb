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

category_stats = Hash.new { |hash, key| hash[key] = { total: 0, correct: 0 } }

round.turns.each do |turn|
  category = turn.card.category
  category_stats[category][:total] += 1
  category_stats[category][:correct] += 1 if turn.correct?
end

category_stats.each do |category, stats|
  category_percent = (stats[:correct].to_f / stats[:total]) * 100
  puts "#{category} - #{category_percent.round(2)}% correct"
end