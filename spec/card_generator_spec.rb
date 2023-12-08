require './lib/card_generator'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards).to be_instance_of(Array)
    expect(cards[0]).to be_instance_of(Card)
  end

  it 'has cards' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards.count).to eq(3)
  end

  it 'has a question' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards[0].question).to eq("What is the capital of Alaska?")
  end

  it 'has an answer' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards[0].answer).to eq("Juneau")
  end

  it 'has a category' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards[0].category).to eq(:Geography)
  end
  
  it 'has a different question' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards[1].question).to eq("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?")
  end

  it 'has a different answer' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards[1].answer).to eq("Mars")
  end

  it 'has a different category' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards[1].category).to eq(:STEM)
  end

  it 'has a different question' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards[2].question).to eq("Describe in words the exact direction that is 697.5° clockwise from due north?")
  end

  it 'has a different answer' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards[2].answer).to eq("North north west")
  end

  it 'has a different category' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards[2].category).to eq(:STEM)
  end
end
