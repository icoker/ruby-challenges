class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end

end

class Deck
  def initialize
    @ranks = [*(2..10), 'J', 'Q', 'K', 'A']
    @suits = ['spades', 'clubs', 'hearts', 'diamonds']
    @cards = []

    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end

  end

  def shuffle
    @cards.shuffle!
  end

  def output
    @cards.each do |card|
      card.output_card
    end
  end

  def deal
    @cards.shift.output_card
  end


end

deck = Deck.new
deck.shuffle
deck.deal

