class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    cards.select { |card| card.category == category}
  end

  # def cards_in_category(category)
  #   result = []

  #   cards.each do |card|
  #     result << card if card.category == category
  #   end
  #   result
  # end
end