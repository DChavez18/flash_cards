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
    turns.map do |turn|
      if turn.correct?
        correct += 1
      end
      return correct
    end
  end
end