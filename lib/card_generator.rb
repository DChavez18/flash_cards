require_relative './card'

class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    read_file(filename)
  end

  private

  def read_file(filename)
    File.open(filename).each do |line|
      question, answer, category = line.chomp.split(',')
      @cards << Card.new(question, answer, category)
    end
  end
end