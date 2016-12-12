class Poker
  attr_accessor :hand1, :hand2

  def initialize(hand1, hand2)
    @hand1 = hand1.split(" ")
    @hand2 = hand2.split(" ")

    @hand1Values, @hand1Suit = data_prep @hand1
    @hand2Values, @hand2Suit = data_prep @hand2
  end

  def compare!
    hand1_flush, hand2_flush = flush?
    return "A" if hand1_flush && !hand2_flush
    return "B" if hand2_flush && !hand1_flush

    hand1_three, hand2_three = any_three?
    return "A" if hand1_three && !hand2_three
    return "B" if hand2_three && !hand1_three

    hand1_two, hand2_two = any_two?
    return "A" if hand1_two && !hand2_two
    return "B" if hand2_two && !hand1_two

    hand1_high_card, hand2_high_card = high_card
    return "A" if hand1_high_card > hand2_high_card
    return "B" if hand2_high_card > hand1_high_card
    return "Tie"

  end

  def flush?
    results = []
    [@hand1Suit, @hand2Suit].each do |handSuit|
      firstHandValue = handSuit.first
      results << handSuit.all? { |s| s == firstHandValue }
    end

    results
  end

  def data_prep(hand)
    handValues, handSuit = [], []
    hand.each do |h|
      handValues << h.chars.first
      handSuit << h.chars.last
    end

    [handValues, handSuit]
  end

  # returns an array of 2 boolean elements; first bool indicates if first hand has three-of-a-kind
  # second bool indicates if second hand has three-of-a-kind
  def any_three?
    results=[]
    [@hand1Values, @hand2Values].each do |handV|
      freqHash = Hash.new(0) 
      handV.each { |h| freqHash [h] += 1}
      results << freqHash.values.any? { |freq| freq >= 3}
    end

    results
  end

  # returns an array of 2 boolean elements; first bool indicates if first hand has two-of-a-kind
  # second bool indicates if second hand has two-of-a-kind
  def any_two?
    results=[]
    [@hand1Values, @hand2Values].each do |handV|
      freqHash = Hash.new(0)
      handV.each { |h| freqHash[h] += 1}
      results << freqHash.values.any? { |freq| freq >= 2}
    end

    results
  end


  # returns an array of 2 int elements; first element is high card of first hand
  # second element is the high card of second hand
  def high_card
    valueInt = {"A" => 14, "K"=> 13, "Q"=> 12, "J"=> 11}
    results=[]

    [@hand1Values, @hand2Values].each do |handV|
      maxValue = 0
      handV.each do |h|
        value = valueInt[h] ? valueInt[h] : h
        maxValue = value.to_i if value.to_i > maxValue 
      end
      results << maxValue
    end

    results
  end

end
