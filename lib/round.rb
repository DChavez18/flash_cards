class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    deck.cards.shift
    turn
  end

  def number_correct
    correct = 0
    turns.each do |turn|
      correct += 1 if turn.correct?
    end
    correct
  end

  def number_correct_by_category(category)
    correct_turns = turns.select { |turn| turn.correct? && turn.card.category == category }
    correct_turns.count
  end

  def percent_correct
    total_turns = turns.count
    return 0 if total_turns.zero?

    (number_correct.to_f / total_turns.to_f) * 100
  end

  def percent_correct_by_category(category)
    category_turns = turns.select { |turn| turn.card.category == category }
    total_category_turns = category_turns.count

    return 0 if total_category_turns.zero?

    (number_correct_by_category(category).to_f / total_category_turns.to_f) * 100
  end
end