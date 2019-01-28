require 'set'
require 'card'

RSpec.describe 'a playing card' do
  def card(params = {})
    defaults = {
      suit: :hearts,
      rank: 7,
    }

    Card.build(*defaults.merge(params).values_at(:suit, :rank))
  end

  it 'has a suit' do
    raise unless card(suit: :spades).suit == :spades
  end

  it 'has a rank' do
    raise unless card(rank: 4).rank == 4
  end

  context 'equality' do
    it 'is equal to itself' do
      subject = card(suit: :spades, rank: 4)
      object =  card(suit: :spades, rank: 4)

      raise unless subject == object
    end

    it 'is hash equal to itself' do
      subject = card(suit: :spades, rank: 4)
      object =  card(suit: :spades, rank: 4)

      raise unless Set.new([subject, object]).size == 1
    end

    describe 'comparing cards of differing suits' do
      it 'is not equal' do
        subject = card(suit: :spades, rank: 4)
        object =  card(suit: :hearts, rank: 4)

        raise unless subject != object
      end

      it 'is not hash equal' do
        subject = card(suit: :spades, rank: 4)
        object =  card(suit: :hearts, rank: 4)

        raise unless Set.new([subject, object]).size == 2
      end
    end

    describe 'comparing to a card of different rank' do
      it 'is not equal' do
        subject = card(suit: :spades, rank: 4)
        object =  card(suit: :spades, rank: 6)

        raise unless subject != object
      end

      it 'is not hash equal' do
        subject = card(suit: :spades, rank: 4)
        object =  card(suit: :spades, rank: 5)

        raise unless Set.new([subject, object]).size == 2
      end
    end
  end

  describe 'a jack' do
    it 'ranks higher than a 10' do
      lower = card(rank: 10)
      jack = card(rank: :jack)

      raise unless jack.rank > lower.rank
    end
  end

  describe 'a queen' do
    it 'ranks higher than a jack' do
      jack = card(rank: :jack)
      queen = card(rank: :queen)

      raise unless queen.rank > jack.rank
    end
  end

  describe 'a king' do
    it 'ranks higher than a queen' do
      queen = card(rank: :queen)
      king = card(rank: :king)

      raise unless king.rank > queen.rank
    end
  end
end
